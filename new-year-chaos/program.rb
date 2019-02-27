#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
  q.each_with_index.inject(0) do |bribes, (person, index)|
    return bribes if q[index + 1].nil?
    index_diff = person - index - 1
    prev_org = person - 2
    if index_diff <= 0 && prev_org >= 0
      prev = index - 1
      person_brive = prev_org.upto(prev).all? { |i| q[i] > person }
      distance = person_brive ? 1 : 0
    else
      distance = [index_diff, 0].max
    end
    if ENV['DEBUG'] == "true"
      puts "person #{person}"
      puts "distance #{distance}"
      puts "index_diff #{index_diff}"
      puts "bribes #{bribes}"
      puts ""
    end
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
