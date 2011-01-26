module Marvin
  module Handler
    @klasses = []

    module ClassMethods
      def command options
        @regex = options[:regex]
        @syntax = options[:syntax]
        @description = options[:description]
      end

      def help
        "*#{@syntax}* :: #{@description}"
      end

      def should_handle_for? message_body
        return false unless (@regex && message_body)
        message_body.match(@regex)
      end

      def handle_in_thread from, body, bot
        worker = self.new
        Thread.new { worker.handle(from, body, bot) }
      end
    end

    def self.included(klass)
      klass.extend ClassMethods
      @klasses << klass
    end

    def self.klasses
      @klasses
    end
  end
end