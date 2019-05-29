#!/bin/ruby

require 'json'
require 'stringio'

def debug(actual, distance, index_diff, bribes)
  if ENV['DEBUG'] == "true"
    puts "actual #{actual}"
    puts "distance #{distance}"
    puts "index_diff #{index_diff}"
    puts "bribes #{bribes}"
    puts ""
  end
end


# Complete the minimumBribes function below.
def minimumBribes(q)
  q.each_with_index.inject(0) do |bribes, (actual, index)|
    return bribes if q[index + 1].nil?

    index_diff = actual - index - 1
    maximun_distance = actual - 2
    distance = if index_diff <= 0 && maximun_distance >= 0 then
      q[maximun_distance...index].all? { |x| x > actual } ? 1 : 0
    else
      [index_diff, 0].max
    end

    debug(actual, distance, index_diff, bribes)

    if distance > 2
      return "Too chaotic"
      break
    end
    bribes + distance
  end
end

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    q = gets.rstrip.split(' ').map(&:to_i)
    
    puts minimumBribes q
end
