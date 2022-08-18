#!/usr/bin/env ruby
numbers = Hash.new
numbers["one"] = 1
numbers["two"] = 2
numbers["three"] = 3

puts "numbers: #{numbers}"
puts ""

numbers = { "one" => 1, "two" => 2, "three" => 3}
puts "numbers: #{numbers}"
puts ""

numbers = { :one => 1, :two => 2, :three => 3}
puts "numbers: #{numbers}"
puts ""

numbers = { :one => 1, :two => 2, }
puts "numbers: #{numbers}"
puts ""

numbers = { one: 1, two: 2, three: 3}
puts "numbers: #{numbers}"
puts ""
