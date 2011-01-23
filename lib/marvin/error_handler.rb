module Marvin
  class ErrorHandler
    def self.handle_message from, body, bot, message
      bot.reply(from, message)
    end
  end
end