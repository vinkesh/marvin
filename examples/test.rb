require 'rubygems'
require 'marvin'

class One
  include Marvin::Handler

  command :regex => /^one/, :syntax => "one <something>", :description => "Does Something"

  def handle from, body, bot
    puts "running one"
    sleep 4
    bot.reply(from, "Running one")
  end
end

class Two
  include Marvin::Handler

  command :regex => /^two/, :syntax => "two <nothing>", :description => "Does Nothing"

  def handle from, body, bot
    puts "running two"
    sleep 2
    bot.reply(from, "Running two")
  end
end

bot = Marvin::Android.new("some_chat_bot@gmail.com", "some_password")
bot.listen