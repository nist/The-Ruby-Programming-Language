class MyError < StandardError; end

def factorial(n)                 # Define a factorial method with argument n
  raise "bad argument" if n < 1  # Raise an exception for bad n
  return 1 if n == 1             # factorial(1) is 1
  n * factorial(n-1)             # Compute other factorials recursively
end

n = 1
raise RuntimeError, "bad argument" if n < 1
raise RuntimeError.new("bad argument") if n < 1
raise RuntimeError.exception("bad argument") if n < 1

raise ArgumentError if n < 1

raise ArgumentError, "Expected argument >= 1. Got #{n}" if n < 1

if n < 1
  raise ArgumentError, "Expected argument >= 1. Got #{n}", caller
end

raise TypeError, "Integer argument expected" if not n.is_a? Integer

begin
  # Any number of Ruby statements go here.
  # Usually, they are executed without exceptions and
  # execution continues after the end statement.
rescue
  # This is the rescue clause; exception-handling code goes here.
  # If an exception is raised by the code above, or propagates up
  # from one of the methods called above, then execution jumps here.
end

begin                                # Handle exceptions in this block
  x = factorial(-1)                  # Note illegal argument
rescue => ex                         # Store exception in variable ex
  puts "Rescue"
  puts "#{ex.class}: #{ex.message}"  # Handle exception by printing message
end                                  # End the begin/rescue block

# rescue Exception
#
# rescue ArgumentError => e
#
# rescue ArgumentError, TypeError => error

begin
  x = factorial(1)
rescue ArgumentError => ex
  puts "Try again with a value >= 1"
rescue TypeError => ex
  puts "Try again with an integer"
end

def explode        # This method raises a RuntimeError 10% of the time
  raise "bam!" if rand(10) == 0
end

def risky
  begin            # This block
    10.times do    # contains another block
      explode      # that might raise an exception.
    end            # No rescue clause here, so propagate out.
  rescue TypeError # This rescue clause cannot handle a RuntimeError..
    puts $!        # so skip it and propagate out.
  end
  "hello"          # This is the normal return value, if no exception occurs.
end                # No rescue clause here, so propagate up to caller.

def defuse
  begin                     # The following code may fail with an exception.
    puts risky              # Try to invoke print the return value.
  rescue RuntimeError => e  # If we get an exception
    puts e.message          # print the error message instead.
  end
end

defuse

# require 'open-uri'

# tries = 0       # How many times have we tried to read the URL
# begin           # This is where a retry begins
#   tries += 1    # Try to print out the contents of a URL
#   open('http://www.example.com/') {|f| puts f.readlines }
# rescue OpenURI::HTTPError => e  # If we get an HTTP error
#   puts e.message                # Print the error message
#   if (tries < 4)                # If we haven't tried 4 times yet...
#     sleep(2**tries)             # Wait for 2, 4, or 8 seconds
#     retry                       # And then try again!
#   end
# end

begin
  return 1     # Skip to the ensure clause before returning to caller
ensure
  return 2     # Replace the return value with this new value
end

def test
  begin return 1 ensure 2 end
end

def method_name(x)
  # The body of the method goes here.
  # Usually, the method body runs to completion without exceptions
  # and returns to its caller normally.
rescue
  # Exception-handling code goes here.
  # If an exception is raised within the body of the method, or if
  # one of the methods it calls raises an exception, then control
  # jumps to this block.
else
  # If no exceptions occur in the body of the method
  # then the code in this clause is executed.
ensure
  # The code in this clause is executed no matter what happens in the
  # body of the method. It is run if the method runs to completion, if
  # it throws an exception, or if it executes a return statement.
end

# Compute factorial of x, or use 0 if the method raises an exception
y = factorial(x) rescue 0

y = begin
      factorial(x)
    rescue
      0
    end
