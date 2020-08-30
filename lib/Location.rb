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



