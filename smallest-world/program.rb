#!/bin/ruby

require 'json'
require 'stringio'

@weightsEnum = Enumerator.new do |y|
  a = 1
  b = (2 * a) + 1
  26.times do |x|
    y << a
    a = b
    b = ((x + 3) * a) + 1
  end
end

@letters = ('a'..'z').to_a

@weights = @weightsEnum.each_with_index.inject({}) do |acc, (weight, index)|
  acc[weight] = @letters[index]
  acc
end

def convertSmallestNumber(number)
  posibleValues = @weightsEnum.select {|x| x <= number }
  result = ''
  while number > 0 do
    letterWeight = posibleValues.last
    repeticions = number / letterWeight
    if (repeticions > 0) 
      result += "#{@weights[letterWeight]}" * repeticions
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