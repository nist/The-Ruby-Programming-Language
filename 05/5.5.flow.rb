# Return two copies of x, if x is not nil
def double(x)
  return nil if x == nil   # Return prematurely
  return x, x.dup          # Return multiple values
end

# Return the index of the first occurrence of target within array or nil
# Note that this code just duplicates the Array.index method
def find(array, target)
  array.each_with_index do |element,index|
    return index if (element == target)  # return from find
  end
  nil  # If we didn't find the element, return nil
end

puts "\nType \"quit\" to exit:"
while(line = gets.chop)     # A loop starts here
  break if line == "quit"   # If this break statement is executed...
  puts eval(line)
end
puts "Good bye"             # ...then control is transferred here

# f.each do |line|             # Iterate over the lines in file f
#   break if line == "quit\n"  # If this break statement is executed...
#   puts eval(line)
# end
# puts "Good bye"              # ...then control is transferred here

# while(line = gets.chop)     # A loop starts here
#   next if line[0,1] == "#"  # If this line is a comment, go on to the next
#   puts eval(line)
#   # Control goes here when the next statement is executed
# end
#
# f.each do |line|              # Iterate over the lines in file f
#   next if line[0,1] == "#"    # If this line is a comment, go to the next
#   puts eval(line)
#   # Control goes here when the next statement is executed
# end

data = [1,2,3,4,5]
squareroots = data.collect do |x|
  next 0 if x < 0  # Return 0 for negative values
  Math.sqrt(x)
end

squareroots = data.collect do |x|
  if (x < 0) then 0 else Math.sqrt(x) end
end

i = 0
while(i < 3)   # Prints "0123" instead of "012"
  # Control returns here when redo is executed
  print i
  i += 1
  redo if i == 3
end

puts "Please enter the first word you think of"
words = %w(apple banana cherry)   # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|
  # Control returns here when redo is executed
  print word + "> "               # Prompt the user
  response = gets.chop            # Get a response
  if response.size == 0           # If user entered nothing
    word.upcase!                  # Emphasize the prompt with uppercase
    redo                          # And skip to the top of the block
  end
  response                        # Return the response
end

n = 10
n.times do |x|   # Iterate n times from 0 to n-1
  print x        # Print iteration number
  if x == 9      # If we've reached 9
    n -= 1       # Decrement n (we won't reach 9 the next time!)
    # retry        # Restart the iteration
  end
end

# This method behaves like a while loop: if x is non-nil and non-false,
# invoke the block and then retry to restart the loop and test the
# condition again. This method is slightly different than a true while loop:
# you can use C-style curly braces to delimit the loop body. And
# variables used only within the body of the loop remain local to the block.
def repeat_while(x)
  if x     # If the condition was not nil or false
    yield  # Run the body of the loop
    # retry  # Retry and re-evaluate loop condition
  end
end

# data = [[[1,2],[3,4]],[8,9],[11,10]]
# for matrix in data do             # Process a deeply nested data structure.
#   catch :missing_data do          # Label this statement so we can break out.
#     for row in matrix do
#       for value in row do
#         throw :missing_data unless value # Break out of two loops at once.
#         # Otherwise, do some actual data processing here.
#       end
#     end
#   end
#   # We end up here after the nested loops finish processing each matrix.
#   # We also get here if :missing_data is thrown.
# end

print "\n"
