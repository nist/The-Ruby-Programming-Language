3.times { puts "thank you!" }
# data.each {|x| puts x }
[1,2,3].map {|x| x*x }
factorial = 1
n = 10
2.upto(n) {|x| factorial *= x }


chars = "hello world".tap {|x| puts "original object: #{x.inspect}"}
  .each_char         .tap {|x| puts "each_char returns: #{x.inspect}"}
  .to_a              .tap {|x| puts "to_a returns: #{x.inspect}"}
  .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
  .sort              .tap {|x| puts "sort returns: #{x.inspect}"}

4.upto(6) {|x| print x}

3.times {|x| print x }

0.step(Math::PI, 0.1) {|x| puts Math.sin(x) }

[1,2,3].each {|x| print x }
(1..3).each  {|x| print x }

filename = "5.1.conditionals.rb"
File.open(filename) do |f|
  f.each {|line| print line }
end

File.open(filename) do |f|
  f.each_with_index do |line,number|
    print "#{number}: #{line}"
  end
end

squares = [1,2,3].collect {|x| x*x}

evens = (1..10).select {|x| x%2 == 0}

odds = (1..10).reject {|x| x%2 == 0}

data = [2, 5, 3, 4]
sum = data.inject {|sum, x| sum + x }
floatprod = data.inject(1.0) {|p,x| p*x }
max = data.inject {|m,x| m>x ? m : x }

def twice
  yield
  yield
end

# This method expects a block. It generates n values of the form
# m*i + c, for i from 0..n-1, and yields them, one at a time,
# to the associated block.
def sequence(n, m, c)
  i = 0
  while(i < n)      # Loop n times
    yield m*i + c   # Invoke the block, and pass a value to it
    i += 1          # Increment i each time
  end
end

# Here is an invocation of that method, with a block.
# It prints the values 1, 6, and 11
sequence(3, 5, 1) {|y| puts y }

# Generate n points evenly spaced around the circumference of a
# circle of radius r centered at (0,0). Yield the x and y coordinates
# of each point to the associated block.
def circle(r,n)
  n.times do |i|    # Notice that this method is implemented with a block
    angle = Math::PI * 2 * i / n
    yield r*Math.cos(angle), r*Math.sin(angle)
  end
end

# This invocation of the iterator prints:
# (1.00, 0.00) (0.00, 1.00) (-1.00, 0.00) (-0.00, -1.00)
circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y }

# Return an array with n elements of the form m*i+c
# If a block is given, also yield each element to the block
def sequence(n, m, c)
  i, s = 0, []                  # Initialize variables
  while(i < n)                  # Loop n times
    y = m*i + c                 # Compute value
    yield y if block_given?     # Yield, if block
    s << y                      # Store the value
    i += 1
  end
  s                             # Return the array of values
end

# Call this method with an Enumerator instead of a mutable array.
# This is a useful defensive strategy to avoid bugs.

s = "hello"
s.enum_for(:each_char).map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]


"hello".chars.map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]

enumerator = 3.times             # An enumerator object
enumerator.each {|x| print x }   # Prints "012"


# downto returns an enumerator with a select method
10.downto(1).select {|x| x%2==0}  # => [10,8,6,4,2]

# each_byte iterator returns an enumerator with a to_a method
"hello".each_byte.to_a            # => [104, 101, 108, 108, 111]

def twice
  if block_given?
    yield
    yield
  else
    self.to_enum(:twice)
  end
end

enumerator = s.each_char.with_index


text =<<TEXT
An enumerator as external iterator
So we can use rescue below
Call the next method repeatedly
When there are no more values
An expected, nonexceptional condition
TEXT
for line, number in text.each_line.with_index
  print "#{number+1}: #{line}"
end

iterator = 9.downto(1)             # An enumerator as external iterator
begin                              # So we can use rescue below
  print iterator.next while true   # Call the next method repeatedly
rescue StopIteration               # When there are no more values
  puts "...blastoff!"              # An expected, nonexceptional condition
end

iterator = 9.downto(1)
loop do                 # Loop until StopIteration is raised
  print iterator.next   # Print next item
end
puts "...blastoff!"

module Iterable
  include Enumerable          # Define iterators on top of each
  def each                    # And define each on top of next
    loop { yield self.next }
  end
end

def iterate(iterator)
  loop { yield iterator.next }
end

iterate(9.downto(1)) {|x| print x }

# Call the each method of each collection in turn.
# This is not a parallel iteration and does not require enumerators.
def sequence(*enumerables, &block)
  enumerables.each do |enumerable|
    enumerable.each(&block)
  end
end

# Iterate the specified collections, interleaving their elements.
# This can't be done efficiently without external iterators.
# Note the use of the uncommon else clause in begin/rescue.
def interleave(*enumerables)
  # Convert enumerable collections to an array of enumerators.
  enumerators = enumerables.map {|e| e.to_enum }
  # Loop until we don't have any more enumerators.
  until enumerators.empty?
    begin
      e = enumerators.shift   # Take the first enumerator
      yield e.next            # Get its next and pass to the block
    rescue StopIteration      # If no more elements, do nothing
    else                      # If no exception occurred
      enumerators << e        # Put the enumerator back
    end
  end
end

# Iterate the specified collections, yielding tuples of values,
# one value from each of the collections. See also Enumerable.zip.
def bundle(*enumerables)
  enumerators = enumerables.map {|e| e.to_enum }
  loop { yield enumerators.map {|e| e.next} }
end

# Examples of how these iterator methods work
a,b,c = [1,2,3], 4..6, 'a'..'e'
sequence(a,b,c) {|x| print x}   # prints "123456abcde"
interleave(a,b,c) {|x| print x} # prints "14a25b36cde"
bundle(a,b,c) {|x| print x}     # '[1, 4, "a"][2, 5, "b"][3, 6, "c"]'

a = [1,2,3,4,5]
a.each {|x| puts "#{x},#{a.shift}" }  # prints "1,1\n3,2\n5,3"

module Enumerable
  def each_in_snapshot &block
    snapshot = self.dup    # Make a private copy of the Enumerable object
    snapshot.each &block   # And iterate on the copy
  end
end
