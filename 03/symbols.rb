#!/usr/bin/env ruby

puts "3.6 Symbols"
puts ""

puts ":symbol #{:symbol}"
puts ":\"symbol\" #{:"symbol"}"
puts ":'another long symbol' #{:'another long symbol'}"
s = "string"
sym = :"#{s}"
puts "s: #{s}"
puts ":\"\#{s}\" #{s}"

str = "string"
puts "str: #{str}"
sym = str.intern
puts "str.intern: #{sym}"
puts "str.to_sym: #{str.to_sym}"
puts "sym.to_s: #{sym.to_s}"
puts "sym.id2name: #{sym.id2name}"
