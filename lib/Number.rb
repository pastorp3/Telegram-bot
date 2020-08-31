# rubocop:disable Naming/FileName

class GenerateNumber
  def initialize
    number = rand(0..10)
    @data = String(number)
  end

  def random(input)
    input == @data
  end

  def answer
    @data
  end
end

# rubocop:enable Naming/FileName
