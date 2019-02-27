#!/bin/ruby

require 'json'
require 'stringio'

# Complete the formingMagicSquare function below.
def formingMagicSquare(s)


end

s = Array.new(3)

3.times do |i|
    s[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = formingMagicSquare s

puts result
