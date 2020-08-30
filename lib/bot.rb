require 'telegram/bot'
require_relative 'Location.rb'
require_relative 'Methods.rb'
require_relative 'Number.rb'

class Bot
  def initialize
    token = ""
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        begin
          @keyword = message.text[%r{/([a-zA-Z]+)}]
        rescue StandardError => e
          log.fatal(e)
          log.fatal(message.text)
        else
          case @keyword
          when '/map'
            m = message.text
            input = set_location(m)
            if input == false
              bot.api.send_message(chat_id: message.chat.id, text: "No valid country type again")
            else
              location = SetLocation.new
              latitud = location.latitud(input)
              longitude = location.longitude(input)
              if longitude == false && latitud == false
                bot.api.send_message(chat_id: message.chat.id, text: "No valid country type again")
              else
                bot.api.send_location(chat_id: message.chat.id, latitude: latitud, longitude: longitude)
              end
            end
          when '/end'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
          when '/play'
            m = message.text
            input = set_number(m)
            if input == false
              bot.api.send_message(chat_id: message.chat.id, text: 'No valid number type again')
            else
              play = GenerateNumber.new
              answer = play.random(input)
                if answer == false
                  r = play.answer
                  bot.api.send_message(chat_id: message.chat.id, text: "lose the number was #{r}")
                else
                  r = play.answer
                  bot.api.send_message(chat_id: message.chat.id, text: "Win !!!!!")

                end
            end
          end
          case message.text
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} 
              Welcome to Jose bot here is my commands:\n
              /start It will send you welcome message with your name\n
              /map  It will send you the location of the country that you
              type like /map Mexico be sure that type the command 
              /map the a space and the name of the country\n
              /play 'number' type and play with the bot you have to 
              choose a number between 0 to 10 like /play 1, Good luck!\n
              /end It will send you a goodbye message
              ")
          end
        end
      end
    end
  end
end
