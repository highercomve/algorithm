#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
  unfound = []
  found = []
  q.each_with_index.inject(0) do |bribes, (person, index)|
    return bribes if q[index + 1].nil?
    index_diff = person - index - 1
    correct_position = index + 1
    should_be = (found.max || 0) + 1
    found.push person
    unfound.delete person
    if should_be < person
      (should_be...person).each do |x|
        unfound.push x unless found.include?(x) || unfound.include?(x)
      end
    else
      unfound.push correct_position unless found.include?(correct_position) || unfound.include?(correct_position)
    end
    
    distance = !unfound.min.nil? && unfound.min < person ? unfound.size : 0

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
    distance > 0 ? bribes + distance : bribes
  end
end

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    q = gets.rstrip.split(' ').map(&:to_i)
    
    puts minimumBribes q
end
