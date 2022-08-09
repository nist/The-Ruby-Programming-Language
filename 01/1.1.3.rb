#!/usr/bin/env ruby
x = 12
y = 24
minimum = if x < y then x else y end
print "x: #{x}, y: #{y}, minimum: #{minimum}\n"

print "1 + 2 = #{1 + 2}\n"
print "1 * 2 = #{1 * 2}\n"
print "1 + 2 == 3 #{1 + 2 == 3}\n"
print "2 ** 1024 = #{2 ** 1024}\n"
print "Ruby" + " rocks!\n"
print ("Ruby! " * 3) + "\n"
print "%d %s\n" % [3, "rubies"]
print "max = x > y ? x : y = #{max = x > y ? x : y}\n"

print "256 << 2 : #{256 << 2}\n"
print "Hello << ruby : #{'Hello ' << 'ruby'}\n"
