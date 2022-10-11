x = 0

if x < 10
  x += 1
end

if x < 10 then x += 1 end

print "x: #{x}\n"

if x == 1
  name = "one"
elsif x == 2
  name = "two"
elsif x == 3 then name = "three"
elsif x == 4; name = "four"
else
  name = "many"
end

print "name: #{name}\n"

name = if    x == 1 then "one"
       elsif x == 2 then "two"
       elsif x == 3 then "three"
       elsif x == 4 then "four"
       else              "many"
       end

print "name: #{name}\n"

puts case x
when String then "string"
when Numeric then "number"
when TrueClass, FalseClass then "boolean"
else "other"
end

income = 15000
tax = case income
      when 0..7550
        income * 0.1
      when 7550..30650
        755 + (income-7550)*0.15
      when 30650..74200
        4220 + (income-30655)*0.25
      when 74200..154800
        15107.5 + (income-74201)*0.28
      when 154800..336550
        37675.5 + (income-154800)*0.33
      else
        97653 + (income-336550)*0.35
      end
print "tax: #{tax}\n"

puts "Get user's input and process it, ignoring comments and exiting when the user enters the word \"quit\""
while line=gets.chomp do  # Loop, asking the user for input each time
  case line
  when /^\s*#/            # If input looks like a comment...
      next                #   skip to the next line.
  when /^quit$/i          # If input is "quit" (case insensitive)...
    break                 #   exit the loop.
  else                    # Otherwise...
    puts line.reverse     #   reverse the user's input and print it.
  end
end
