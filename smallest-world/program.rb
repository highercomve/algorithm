#!/bin/ruby

require 'json'
require 'stringio'

start = {
  a: 1,
  b: 3,
  values: [],
  keys: {},
}

@weights = ('a'..'z').each_with_index.inject(start) do |acc, (letter, index)|
  weight = acc[:a]
  acc[:values].push(weight)
  acc[:keys][weight] = letter
  acc[:a] = acc[:b]
  acc[:b] = ((index + 3) * acc[:a]) + 1
  acc
end

def convertSmallestNumber(number)
  posibleValues = @weights[:values].take_while {|x| x <= number }
  result = ''
  while number > 0 do
    letterWeight = posibleValues.last
    repeticions = number / letterWeight
    if (repeticions > 0) 
      result += "#{@weights[:keys][letterWeight]}" * repeticions
      number -= letterWeight * repeticions
    end
    posibleValues.pop
  end
  result
end

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    puts convertSmallestNumber(n)
end