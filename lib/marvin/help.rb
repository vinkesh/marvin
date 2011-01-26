module Marvin
  class Help
    include ::Marvin::Handler

    command :regex => /^help$/i, :syntax => "help", :description => "Print this help messages"

    def handle from, body, bot
      help_messages = Handler.klasses.collect(&:help)
      bot.reply(from, help_messages.join("\n"))
    end
  end
end