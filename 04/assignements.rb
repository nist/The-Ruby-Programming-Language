#!/usr/bin/env ruby

x = 1
puts "x: #{x}"

x += 1
puts "x: #{x}"

x,y,z = 1,2,3
puts "x,y,z: #{x},#{y},#{z}"

x = y = 0
puts "x,y: #{x},#{y}"

puts "N = 100 if false: #{N = 100 if false}"

puts "results ||= []: #{results ||= []}"

puts "x = 1,2,3 : #{x = 1,2,3}"

puts "x, = [1,2]: #{x, = [1,2]}"

x,(y,z) = 1,2
puts "x,(y,z) = 1,2: #{x},#{y},#{z}"

x,y,z = 1,[2,3]
puts "x,y,z = 1,[2,3]: #{x},#{y},#{z}"

x,(y,z) = 1,[2,3]
puts "x,(y,z) = 1,[2,3]: #{x},#{y},#{z}"

puts x,y=1,2
puts(x,y=1,2)
puts((x,y=1,2))
