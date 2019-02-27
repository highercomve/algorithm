#!/bin/ruby

require 'json'
require 'stringio'

def calc_right(length, index) 
    ((length - 1) * (index + 1)) % length
end

def calc_left(length, index)
    (index * (length + 1)) % length
end

# Complete the diagonalDifference function below.
def diagonalDifference(arr)
    (0...arr.size).inject(0) do |acc, index|
        left = arr[index][calc_left(arr.size, index)]
        right = arr[index][calc_right(arr.size, index)]
        acc + (left - right)
    end.abs
end

n = gets.to_i

arr = Array.new(n)

n.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = diagonalDifference arr

puts result