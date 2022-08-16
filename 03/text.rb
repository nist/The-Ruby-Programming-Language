#!/usr/bin/env ruby

puts "\n3.2.1.1 Single-quoted string literals"
puts ""
puts 'This is a simple Ruby string literal'
puts 'Won\'t you read O\'Reilly\'s book?'
puts 'This string literal ends with a single backslash: \\'
puts 'This is a backslash-quot: \\\''
puts 'Two backslashes: \\\\'

print "'a\\b' == 'a\\\\b' #{'a\b' == 'a\\b'}\n"

puts 'This is a long string literal \
      that includes a backslash and a newline'

message =
'These three literals are '\
'concatenated into one by interpreter. '\
'The resulting string contains no newlines.'
puts message

puts "\n3.2.1.2 Double-quoted string literals"
puts ""
puts "\t\"This quote begins with a tab and ends with a newline\"\n"
puts "\\"

puts "360 degrees=#{2*Math::PI} radians"

$salutation = 'hello'
puts "#$salutation world"

puts "My phone #: 555-1234"
puts "Use \#{ to interpolate expressions"

puts sprintf("pi is about %.4f", Math::PI)
puts "%s: %f" % ["pi", Math::PI]

puts "This string literals
has two lines \
but written on three"

puts "This string has three lines.\r\n" \
"It is written as three adjacents literals\r\n" \
"separated by escaped newlines\r\n"

puts "\a"

puts "\n3.2.1.3 Unicode"
puts ""

puts "\u00D7"
puts "\u20ac"
puts "\u{A5}"
puts "\u{3C0}"
puts "\u{10ffff}"
puts "\u{20AC 20 A3 20 A5}"

puts "\n3.2.1.4 Arbitrary delimiters"
puts ""

puts %q(Don't worry about escaping ' characters!)
puts %Q|"How about you?", he said|
puts %-This string literal ends with a newline\n-

puts %q_This string literal contains \_underscores\__
puts %Q!Just use a _different_ delimiter\!!

puts %<<book><title>Ruby in a Nutshell</title></book>>
puts %((1+(2*3)) = #{(1+(2*3))})
puts %(A mismatched paren \( must be escaped)

puts "\n3.2.1.5 Here documents"
puts ""

document = <<HERE
This is a string literal.
It has two lines and abruptly ends...
HERE

puts document

greeting = <<HERE + <<THERE + "World"
Hello
HERE
There
THERE

puts greeting

empty = <<END
END

puts empty

document = <<'THIS IS THE END, MY ONLY FRIEND, THE END'
  .
  . lots and lots of text goes here
  . with no escaping at all.
  .
THIS IS THE END, MY ONLY FRIEND, THE END
puts document

puts " "
title = "Home page"
body = "<p>Welcome!</p>"
document = <<-"# # #" # This is the only place we can put a comment
<html>
<head>
<title>#{title}</title>
</head>
<body>
<h1>#{title}</h1>
#{body}
</body>
</html>
 # # #

puts document

puts "\n3.2.1.6 Backtick"
puts ""

listcmd = "ls"
listing = Kernel.`listcmd
puts listing

puts "\n3.2.1.7 String literals and mutability"
puts ""

10.times { puts "test".object_id }

puts "\n3.2.2 Character literals"
puts ""

puts ?A
puts ?"
puts ??

puts ?\u20AC == ?€
puts ?€ == "\u20AC"

puts ?\t
puts ?\C-x
puts ?\111

puts "\n3.2.3 String operators"
puts ""

planet = "Earth"
puts "Hello "+planet

planet_number = 3
puts "Hello planet #"+planet_number.to_s
puts "Hello planet ##{planet_number}"

greeting = "Hello"
greeting << " " << "World"
puts greeting

alphabet = "A"
alphabet << ?B
alphabet << 67
alphabet << 256
puts alphabet

ellipsis = '.'*3
puts ellipsis

a = 0
puts "#{a=a+1}" * 3
