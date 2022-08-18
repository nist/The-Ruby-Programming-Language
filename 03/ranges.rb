#!/usr/bin/env ruby
puts "3.5 Ranges"
puts ""

range = 1..10
puts "#{range}"
range = 1.0..10.0
puts "#{range}"

cold_war = 1945..1989
puts "coldwar.include? 1960: #{cold_war.include? 1960}"

r = 'a'..'c'
r.each {|l| print "[#{l}]"}
puts ""
r.step(2) { |l| print "[#{l}]"}
puts ""
puts "#{r.to_a}"
puts ""

puts "3.5.1 Testing Membership in a Range"
puts ""

r = 0...100
puts "r: #{r}"
puts "r.member? 50: #{r.member? 50}"
puts "r.include? 100: #{r.include? 100}"
puts "r.include? 99.9: #{r.include? 99.9}"

triples = "AAA".."ZZZ"
puts "triples: #{triples}"
puts "triples.include? \"ABC\": #{triples.include? "ABC"}"
puts "triples.include? \"ABCD\": #{triples.include? "ABCD"}"
puts "triples.cover? \"ABCD\": #{triples.cover? "ABCD"}"
puts "triples.to_a.include? \"ABCD\": #{triples.to_a.include? "ABCD"}"
