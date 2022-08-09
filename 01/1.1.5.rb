#!/usr/bin/env ruby
print "x = 1 : #{x = 1}\n"

print "x = y = 255: #{x = y = 255}\n"
print "x += 1 : #{x += 1}\n"
print "y -= 1 : #{y -= 1}\n"

print "x,y = 1,2 : #{x,y = 1,2}\n"
print "x,y = y,x : #{x,y = y,x}\n"
print "x,y,z = [1,2,3] : #{x,y,z = [1,2,3]}\n"

# Define a method to convert Cartesian (x,y) to Polar
def polar(x,y)
  theta = Math.atan2(y,x)
  r = Math.hypot(x,y)
  [r,theta]
end

print "distance, angle = polar(2,2): #{distance, angle = polar(2,2)}\n"
