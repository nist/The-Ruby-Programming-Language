BEGIN {
  # Global initialization code goes here
}

END {
  # Global shutdown code goes here
}

# if (false)
#   BEGIN {
#     puts "if";                   # This will be printed
#     a = 4;                       # This variable only defined here
#   }
# else
#   BEGIN { puts "else" }          # Also printed
# end
#
# 10.times {BEGIN { puts "loop" }} # Only printed once
#
# a = 4;
# if (true)
#   END {                        # This END is executed
#     puts "if";                 # This code is registered
#     puts a                     # The variable is visible; prints "4"
#   }
# else
#   END { puts "else" }          # This is not executed
# end
# 10.times {END { puts "loop" }} # Only executed once
