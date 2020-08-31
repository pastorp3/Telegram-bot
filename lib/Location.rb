# rubocop:disable Naming/FileName
require_relative 'data\countries.rb'

class SetLocation
  def initialize
    @data = data
  end

  def latitud(input)
    if @data.include?(input)
      @data[input][:latitude]
    else false
    end
  end

  def longitude(input)
    if @data.include?(input)
      @data[input][:longitude]
    else false
    end
  end
end

# rubocop:enable Naming/FileName
