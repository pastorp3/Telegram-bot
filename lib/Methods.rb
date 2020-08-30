def set_location(input)
    if input.length <5
      return false
    else
      location = input[5..]
      if location.match(/[0-9]/)
        return false
      else
        if location[0].match(/[A-Z]/)
        return location
        else
          location = location.capitalize!
          return location
        end
      end
  end
end

def set_number(input)
  op = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
  if input.length < 6
    return false
  else
    number = input[6..]
    if number.match(/[a-z]/) 
      return false
    else
      if number.length > 2 
        return false
      elsif op.include?(number)
        return number
      else return false
      end
    end
  end
end