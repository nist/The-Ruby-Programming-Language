#!/usr/bin/env ruby

puts "3.8.1 Object References"
puts ""

s = "Ruby"
puts "s: #{s}"

t = s
puts "t = s"
puts "t: #{t}"

t[-1] = ""
puts "t[-1] = \"\""
puts "s: #{s}"

t = "Java"
puts "t = \"Java\""
print s,t
puts ""

puts "3.8.9 Marshaling Objects"
puts ""

s = String.new("Not Marshall")
puts "s.inspect: #{s.inspect}"
s_copy = Marshal.load(Marshal.dump(s))
puts "s_copy.inspect: #{s_copy.inspect}"
puts ""

puts "3.8.10 Freezing Objects"
puts ""

s = "ice"
puts "s: #{s}"
s.freeze
puts "s.freeze"
puts "s.frozen?: #{s.frozen?}"
puts ""

puts "3.8.11 Tainting Objects"
puts ""

puts "Deprecated in Ruby 3.2"
