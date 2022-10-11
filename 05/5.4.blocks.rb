# Print the numbers 1 to 10
1.upto(10) {|x| puts x }   # Invocation and block on one line with braces
1.upto(10) do |x|          # Block delimited with do/end
  puts x
end
# 1.upto(10)                 # No block specified
#  {|x| puts x }             # Syntax error: block not after an invocation

1.upto(3) {|x| puts x }    # Parens and curly braces work
1.upto 3 do |x| puts x end # No parens, block delimited with do/end
# 1.upto 3 {|x| puts x }     # Syntax Error: trying to pass a block to 3!

# The Hash.each iterator passes two arguments to its block
hash = {:one => 1, :two => 2, :three => 3}
hash.each do |key, value|   # For each (key,value) pair in the hash
  puts "#{key}: #{value}"   # Print the key and the value
end                         # End of the block

# The block takes two words and "returns" their relative order
words = ["one","two"]
words.sort! {|x,y| y <=> x }

array = [1, 2, 3]
array.collect do |x|
  next 0 if x == nil  # Return prematurely if x is nil
  next x, x*x         # Return two values
end

array.collect do |x|
  if x == nil
    0
  else
    [x, x*x]
  end
end

total = 0
data = [0,1,0,0,0,0,1,1,1,0,1,0]
data.each {|x| total += x }  # Sum the elements of the data array
puts total                   # Print out that sum

1.upto(10) do |i|         # 10 rows
  1.upto(10) do |i|       # Each has 10 columns
    print "#{i} "         # Print column number
  end
  print " ==> Row #{i}\n" # Try to print row number, but get column number
end

x = y = 0            # local variables
1.upto(4) do |x;y|   # x and y are local to block
                     # x and y "shadow" the outer variables
  y = x + 1          # Use y as a scratch variable
  puts y*y           # Prints 4, 9, 16, 25
end
[x,y]                # => [0,0]: block does not alter these

# hash.each {|key,value; i,j,k| ... }

# key,value = k,v

# {:one=>1}.each_pair {|key,value| ... } # key=:one, value=1

# {:one=>1}.each_pair {|$key, @value| ... } # No longer works in Ruby 1.9

# hash.each {|k,v| ... }  # key and value assigned to params k and v

# k,v = [key, value]

def two; yield 1,2; end  # An iterator that yields two values
two {|x| p x }     # Ruby 1.8: warns and prints [1,2],
two {|x| p x }     # Ruby 1.9: prints 1, no warning
two {|*x| p x }    # Either version: prints [1,2]; no warning
two {|x,| p x }    # Either version: prints 1; no warning

def five; yield 1,2,3,4,5; end     # Yield 5 values
five do |head, *body, tail|        # Extra values go into body array
  print head, body, tail           # Prints "1[2,3,4]5"
end

def hashiter; yield :a=>1, :b=>2; end  # Note no curly braces
hashiter {|hash| puts hash[:a] }       # Prints 1

# This Proc expects a block
printer = lambda {|&b| puts b.call } # Print value returned by b
printer.call { "hi" }                # Pass a block to the block!

# [1,2,3].each {|x,y=10| print x*y }     # SyntaxError!

[1,2,3].each &->(x,y=10) { print x*y }  # Prints "102030"
print "\n"
