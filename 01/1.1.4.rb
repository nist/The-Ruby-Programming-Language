#!/usr/bin/env ruby

def square(x)
  x*x
end

print "square(8):#{square(8)}\n"

# Singletonmethods
def Math.square(x)
  x*x
end

print "Math.square(16):#{Math.square(16)}\n"

# square is in fact a private method of Object
print "Object.private_method_defined?(:square):#{Object.private_method_defined?(:square)}\n"
