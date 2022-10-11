# This method expects an array of filenames.
# It returns an array of strings holding the content of the named files.
# The method creates one thread for each named file.
def readfiles(filenames)
  # Create an array of threads from the array of filenames.
  # Each thread starts reading a file.
  threads = filenames.map do |f|
    Thread.new { File.read(f) }
  end

  # Now create an array of file contents by calling the value
  # method of each thread. This method blocks, if necessary,
  # until the thread exits with a value.
  threads.map {|t| t.value }
end

f = Fiber.new {              # Line  1: Create a new fiber
  puts "Fiber says Hello"    # Line  2:
  Fiber.yield                # Line  3: goto line 9
  puts "Fiber says Goodbye"  # Line  4:
}                            # Line  5: goto line 11
                             # Line  6:
puts "Caller says Hello"     # Line  7:
f.resume                     # Line  8: goto line 2
puts "Caller says Goodbye"   # Line  9:
f.resume                     # Line 10: goto line 4
                             # Line 11:

f = Fiber.new do |message|
  puts "Caller said: #{message}"
  message2 = Fiber.yield("Hello")    # "Hello" returned by first resume
  puts "Caller said: #{message2}"
  "Fine"                             # "Fine" returned by second resume
end

response = f.resume("Hello")         # "Hello" passed to block
puts "Fiber said: #{response}"
response2 = f.resume("How are you?") # "How are you?" returned by Fiber.yield
puts "Fiber said: #{response2}"

# Return a Fiber to compute Fibonacci numbers
def fibonacci_generator(x0,y0)   # Base the sequence on x0,y0
  Fiber.new do
    x,y = x0, y0                 # Initialize x and y
    loop do                      # This fiber runs forever
      Fiber.yield y              # Yield the next number in the sequence
      x,y = y,x+y                # Update x and y
    end
  end
end

g = fibonacci_generator(0,1)     # Create a generator
10.times { print g.resume, " " } # And use it

class FibonacciGenerator
  def initialize
    @x,@y = 0,1
    @fiber = Fiber.new do
      loop do
        @x,@y = @y, @x+@y
        Fiber.yield @x
      end
    end
  end

  def next           # Return the next Fibonacci number
    @fiber.resume
  end

  def rewind         # Restart the sequence
    @x,@y = 0,1
  end
end

g = FibonacciGenerator.new      # Create a generator
10.times { print g.next, " " }  # Print first 10 numbers
g.rewind; puts                  # Start over, on a new line
10.times { print g.next, " " }  # Print the first 10 again

def each
   loop { yield self.next }
end

class Generator
  def initialize(enumerable)
    @enumerable = enumerable  # Remember the enumerable object
    create_fiber              # Create a fiber to enumerate it
  end

  def next                    # Return the next element
    @fiber.resume             # by resuming the fiber
  end

  def rewind                  # Start the enumeration over
    create_fiber              # by creating a new fiber
  end

  private
  def create_fiber            # Create the fiber that does the enumeration
    @fiber = Fiber.new do     # Create a new fiber
      @enumerable.each do |x| # Use the each method
        Fiber.yield(x)        # But pause during enumeration to return values
      end
      raise StopIteration     # Raise this when we're out of values
    end
  end
end

g = Generator.new(1..10)  # Create a generator from an Enumerable like this
loop { print g.next }     # And use it like an enumerator like this
g.rewind                  # Start over like this
g = (1..10).to_enum       # The to_enum method does the same thing
loop { print g.next }

require 'fiber'

require 'fiber'

f = g = nil

f = Fiber.new {|x|        # 1:
  puts "f1: #{x}"         # 2: print "f1: 1"
  x = g.transfer(x+1)     # 3: pass 2 to line 8
  puts "f2: #{x}"         # 4: print "f2: 3"
  x = g.transfer(x+1)     # 5: return 4 to line 10
  puts "f3: #{x}"         # 6: print "f3: 5"
  x + 1                   # 7: return 6 to line 13
}
g = Fiber.new {|x|        # 8:
  puts "g1: #{x}"         # 9: print "g1: 2"
  x = f.transfer(x+1)     #10: return 3 to line 3
  puts "g2: #{x}"         #11: print "g2: 4"
  x = f.transfer(x+1)     #12: return 5 to line 5
}
puts f.transfer(1)        #13: pass 1 to line 1

require 'continuation'

# Global hash for mapping line numbers (or symbols) to continuations
$lines = {}

# Create a continuation and map it to the specified line number
def line(symbol)
  callcc  {|c| $lines[symbol] = c }
end

# Look up the continuation associated with the number, and jump there
def goto(symbol)
  $lines[symbol].call
end

# # Now we can pretend we're programming in BASIC
# i = 0
# line 10              # Declare this spot to be line 10
# puts i += 1
# goto 10 if i < 5     # Jump back to line 10 if the condition is met
#
# line 20              # Declare this spot to be line 20
# puts i = 1
# goto 20 if i > 0
