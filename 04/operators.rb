#!/usr/bin/env ruby

puts "2 * Math.sqrt(2) < 10 = #{2 * Math.sqrt(2) < 10}"
puts "(1 + 2) * 3 = #{(1 + 2) * 3}"

# Unary
puts "+-1= #{+-1}"
puts "--1= #{--1}"

# Exponentiation
x = 3
puts "#{x}**(1.0/3.0) = #{x**(1.0/3.0)}"
puts "-1**0.5 = #{-1**0.5}"

# Shift and Append
puts "(0b1011 << 1).to_s(2) = #{(0b1011 << 1).to_s(2)}"
puts "(0b10110 >> 2).to_s(2) = #{(0b10110 >> 2).to_s(2)}"

message = "hello"
messages = []
puts "message: #{message}, messages: #{messages}"
puts "message << \" world\" : #{message << " world"}"
puts "messages << message : #{messages << message}"
STDOUT << message
puts ""

# Complement, Union, Intersection
puts "(0b1010 & 0b1100).to_s(2) = #{(0b1010 & 0b1100).to_s(2)}"
puts "(0b1010 | 0b1100).to_s(2) = #{(0b1010 | 0b1100).to_s(2)}"
puts "(0b1010 ^ 0b1100).to_s(2) = #{(0b1010 ^ 0b1100).to_s(2)}"

puts "true & false: #{true & false}"
puts "true | false: #{true | false}"
puts "true ^ false: #{true ^ false}"

# Comparison
puts "String < Object: #{String < Object}"
puts "Object > Numeric: #{Object > Numeric}"
puts "Numeric < Integer: #{Numeric < Integer}"
puts "String < Numeric: #{String < Numeric}"

# Boolean Operators
x = 1
y = 0
puts "#{x} == 0 && #{y} > 1: #{x == 0 && y > 1}"
puts "#{x} && #{y}: #{x && y}"
x = nil
puts "x: #{x}"
puts "x && print(x.to_s): #{x && print(x.to_s)}"

puts "1 || 2 && nil: #{1 || 2 && nil}"
puts "(1 || 2) && nil: #{(1 || 2) && nil}"

# Flip flop
(1..10).each{|x| print x if x==3..3>=3}
puts ""
(1..10).each{|x| print x if x==3...3>=3}
puts ""

# Conditional ?
x = y = z = 0
puts "x,y,z : #{x},#{y},#{z}"
puts "x==3?y:z #{x==3?y:z}"
# x is interpreted as a method
# puts "3==x?y:z #{3==x?y:z}"
# To fix this, add ()
puts "(3==x)?y:z #{(3==x)?y:z}"
# or space
puts "3==x ?y:z #{3==x ?y:z}"
