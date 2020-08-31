# rubocop:disable Naming/FileName
# rubocop:disable Style/IfInsideElse
# rubocop:disable Metrics/PerceivedComplexity

def location(input)
  if input.length < 5
    false
  else
    i = 5
    n = input.length
    location = input[i..n]
    if location.match(/[0-9]/)
      false
    else
      if location[0].match(/[A-Z]/)
      else
        location = location.capitalize!
      end
      location
    end
  end
end

def number(input)
  op = %w[0 1 2 3 4 5 6 7 8 9 10]
  if input.length < 6
    false
  else
    i = 6
    n = input.length
    number = input[i..n]
    if number.match(/[a-z]/)
      false
    else
      if number.length > 2
        false
      elsif op.include?(number)
        number
      else false
      end
    end
  end
end

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/IfInsideElse
# rubocop:enable Naming/FileName
