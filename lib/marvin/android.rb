module Marvin
  class Android
    def initialize user_id, password, jabber_host = 'talk.google.com', jabber_port = 5222
      @client = Jabber::Client.new(Jabber::JID::new(user_id))
      @client.connect(jabber_host, jabber_port)
      @client.auth(password)
      @client.send(Jabber::Presence.new.set_type(:available))
    end

    def listen
      EM::run do
        handle_received_messages
      end
    end

    def handle_received_messages
      @client.add_message_callback do |incoming_message|
        begin
          if incoming_message.type != :error
            handle(incoming_message)
          else
            ErrorHandler.handle_message from(incoming_message), incoming_message.body, self, "There was some error in recieved messag"
          end
        rescue => e
          ErrorHandler.handle_message from(incoming_message), incoming_message.body, self, "There were following error:: #{e}"
        end
      end
    end

    def handle(incoming_message)
      handling_klass = Handler.klasses.find {|klass| klass.should_handle_for?(incoming_message.body)}
      handling_klass.handle_in_thread(from(incoming_message), incoming_message.body, self) if handling_klass
    end

    def from incoming_message
      incoming_message.from.to_s.gsub(/\/.*$/, "")
    end
    
    def reply to, message
      msg = Jabber::Message.new(to, message).set_type(:chat)
      @client.send(msg)
    end
  end
end