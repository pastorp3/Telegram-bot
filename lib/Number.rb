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