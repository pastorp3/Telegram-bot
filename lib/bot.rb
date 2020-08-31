# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/BlockLength

require 'telegram/bot'
require_relative 'Location.rb'
require_relative 'Methods.rb'
require_relative 'Number.rb'

class Bot
  def initialize
    @token = token
    main
  end

  def main
    Telegram::Bot::Client.run(@token) do |bot|
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
            status = map(m)
            if status == false
              bot.api.send_message(chat_id: message.chat.id, text: 'No valid country type again')
            elsif map(m)[0] == true
              latitud = map(m)[1]
              longitude = map(m)[2]
              bot.api.send_location(chat_id: message.chat.id, latitude: latitud, longitude: longitude)
            end
          when '/end'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
          when '/play'
            op = %w[0 1 2 3 4 5 6 7 8 9 10]
            m = message.text
            status = play(m)
            if status == false
              bot.api.send_message(chat_id: message.chat.id, text: 'No valid number type again')
            elsif status == true
              bot.api.send_message(chat_id: message.chat.id, text: 'Win !!!!!')
            elsif play(m)[1] == false && op.include?(play(m)[0])
              r = play(m)[0]
              bot.api.send_message(chat_id: message.chat.id, text: "lose the number was #{r}")
            end
          end
          case message.text
          when '/start'
            txt = start
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, #{txt}")
          end
        end
      end
    end
  end

  def map(input)
    m = input
    input = location(m)
    if input == false
      false
    else
      location = SetLocation.new
      latitud = location.latitud(input)
      longitude = location.longitude(input)
      if longitude == false && latitud == false
        false
      else
        [true, latitud, longitude]
      end
    end
  end

  def play(input)
    m = input
    input = number(m)
    if input == false
      false
    else
      play = GenerateNumber.new
      answer = play.random(input)
      r = play.answer
      if answer == false
        [r, false]
      else true
      end
    end
  end

  def start
    text = "
      Welcome to Jose bot here is my commands:\n
      /start It will send you welcome message with your name\n
      /map  It will send you the location of the country that you
      type like /map Mexico be sure that type the command
      /map the a space and the name of the country\n
      /play 'number' type and play with the bot you have to
      choose a number between 0 to 10 like /play 1, Good luck!\n
      /end It will send you a goodbye message
      "
    text
  end

  private

  def token
    token = '1371304009:AAGM5UsCPOvnqp3nfSBQGwyxNyL75B_8quk'
    token
  end
end

# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/AbcSize
