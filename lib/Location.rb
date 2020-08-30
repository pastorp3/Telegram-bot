require_relative 'data\countries.rb'

 

class SetLocation

    def initialize
        @data = data()
    end

    def latitud(input)
        if @data.include?(input)
            return @data[input][:latitude]
        else return false
        end
    end

    def longitude(input)
        if @data.include?(input)
            return @data[input][:longitude]
        else return false
        end
    end


end

class GenerateNumber
    
    def initialize
        number = rand(0..10)
        @data = String(number)
    end

    def random(input)
        if input == @data
            return true
        else return false
        end
    end

    def answer
        return @data
    end


end

