#!/usr/bin/env ruby

words = %w[this is a test]
puts "words: #{words}"
open = %w| ( [ { < |
puts "open: #{open}"
white = %W[\s \t \r \n]
puts "white: #{white}"
puts ""

puts "empty: #{Array.new}"
puts "nils: #{Array.new(3)}"
puts "zeros: #{Array.new(4,0)}"
puts "copy: #{Array.new(Array.new(3))}"
count = Array.new(3){|i| i+1}
puts "count: #{count}"
puts ""

a = [0, 1, 4, 9, 16]
puts "a: #{a}"
puts "a[0]: #{a[0]}"
puts "a[-1]: #{a[-1]}"
puts "a[-2]: #{a[-2]}"
puts "a[a.size-1]: #{a[a.size-1]}"
puts "a[-a.size]: #{a[-a.size]}"
puts "a[8]: #{a[8]}"
puts "a[-8]: #{a[-8]}"
puts ""

a[0] = "zero"
puts "a[0] = \"zero\": #{a}"
a[-1] = 1..16
puts "a[-1] = 1..16: #{a}"
a[8] = 64
puts "a[8] = 64: #{a}"
# Index before start = error
# a[-10] = 100
# puts "a[-10] = 100: #{a}"
puts ""

a = ('a'..'e').to_a
puts "a: #{a}"
puts "a[0,0]: #{a[0,0]}"
puts "a[1,1]: #{a[1,1]}"
puts "a[-2,2]: #{a[-2,2]}"
puts "a[0..2]: #{a[0..2]}"
puts "a[-2..-1]: #{a[-2..-1]}"
puts "a[0...-1]: #{a[0...-1]}"
puts ""

puts "a: #{a}"
a[0,2] = ['A','B']
puts "a[0,2] = ['A','B'] : #{a}"
a[2..5] = ['C','D','E']
puts "a[2..5] = ['C','D','E']: #{a}"
a[0,0] = [1,2,3]
puts "a[0,0] = [1,2,3]: #{a}"
a[0..2] = []
puts "a[0..2] = []: #{a}"
a[-1,1] = ['Z']
puts "a[-1,1] = ['Z']: #{a}"
a[-1,1] = 'Z'
puts "a[-1,1] = 'Z': #{a}"
a[-2,2] = nil
puts "a[-2,2] = nil: #{a}"
puts ""

a = [1,2,3] + [4,5]
puts "a: #{a}"
a = a + [[6,7,8]]
puts "a: #{a}"
puts ""

a = []
puts "a: #{a}"
a << 1
puts "a << 1: #{a}"
a << 2 << 3
puts "a << 2 << 3: #{a}"
a << [4,5,6]
puts "a << [4,5,6]: #{a}"
a.concat [7,8]
puts "a.concat [7,8]: #{a}"
puts ""

a = ['a', 'b', 'c', 'b', 'a'] - ['b', 'c', 'd']
puts "a: #{a}"
puts ""

a = [0] * 8
puts "a: #{a}"
puts ""

a = [1, 1, 2, 2, 3, 3, 4]
puts "a: #{a}"
b = [5, 5, 4, 4, 3, 3, 2]
puts "b: #{b}"
puts "a|b: #{a|b}"
puts "b|a: #{b|a}"
puts "a&b: #{a&b}"
puts "b&a: #{b&a}"
puts ""

a = ('A'..'Z')
a.each {|x| print x }
puts ""
