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

puts "\n3.2.4 Accessing Characters and Substrings"
puts ""

s = 'hello'
puts s[0]
puts s[s.length-1]
puts s[-1]
puts s[-2]
puts s[-s.length]
puts s[s.length]

puts ""
s = 'hello'
puts "s: #{s}"
s[0] = ?H
puts "s[0] = ?H: #{s}"
s[-1] = ?O
puts "s[-1] = ?O: #{s}"
s[s.length] = ?!
puts "s[s.length] = ?!: #{s}"

puts ""
s = 'hello'
puts "s: #{s}"
s[-1] = ""
puts "s[-1] = \"\": #{s}"
s[-1] = "p!"
puts "s[-1] = \"p!\": #{s}"

puts ""
s = 'hello'
puts "s: #{s}"
puts "s[0,2]: #{s[0,2]}"
puts "s[-1,1]: #{s[-1,1]}"
puts "s[0,0]: #{s[0,0]}"
puts "s[0,10]: #{s[0,10]}"
puts "s[s.length,1]: #{s[s.length,1]}"
puts "s[s.length+1,1]: #{s[s.length+1,1]}"
puts "s[0,-1]: #{s[0,-1]}"

puts ""
s = 'hello'
puts "s: #{s}"
s[0,1] = "H"
puts "s[0,1] = \"H\": #{s}"
s[s.length,0] = " world"
puts "s[s.length,0] = \" world\": #{s}"
s[5,0] = ","
puts "s[5,0] = \",\": #{s}"
s[5,6] = ""
puts "s[5,6] = \"\": #{s}"

puts ""
s = 'hello'
puts "s: #{s}"
puts "s[2..3]: #{s[2..3]}"
puts "s[-3..-1]: #{s[-3..-1]}"
puts "s[0..0]: #{s[0..0]}"
puts "s[0...0]: #{s[0...0]}"
puts "s[2..1]: #{s[2..1]}"
puts "s[7..10]: #{s[7..10]}"
s[-2..-1] = "p!"
puts "s[-2..-1] = \"p!\": #{s}"
s[0...0] = "Please "
puts "s[0...0] = \"Please \": #{s}"
s[6..10] = ""
puts "s[6..10] = \"\": #{s}"

puts ""
s = 'hello'
puts "s: #{s}"
while(s["l"])
  s["l"] = "L"
end
puts "after the loop: #{s}"

puts ""
s = 'hello'
puts "s: #{s}"
s[/[aeiou]/] = '*'
puts "after regexp: #{s}"

puts "\n3.2.5 Iterating Strings"
puts ""

s = "¥1000"
puts "s: #{s}"
s.each_char {|x| print "#{x} "}
puts ""
0.upto(s.size-1) {|i| print "#{s[i]} "}
puts ""

puts "\n3.2.6 Encoding and Multibyte"
puts ""

# _*_ coding: utf-8 _*_
s = "2×2=4"
puts "s: #{s}"
puts "s.bytesize: #{s.bytesize}"
s.bytesize.times {|i| print s.getbyte(i), " "}
puts ""
puts "s.length: #{s.length}"
s.length.times {|i| print s[i]," "}
puts ""
s.setbyte(5, s.getbyte(5)+1)
puts "s at the end: #{s}"
puts ""

s = "2×2=4"
puts "s: #{s}"
puts "s encoding: #{s.encoding}"
t = "2+2=4"
puts "t: #{t}"
puts "t encoding: #{t.encoding}"
puts ""

# text = stream.readline.force_encoding("utf-8")
# puts "After encoding: #{text}"
# bytes = text.dup.force_encoding(nil)

s = "\xa4".force_encoding("utf-8")
puts s.valid_encoding?
puts ""

euro1 = "\u20AC"
puts euro1
puts euro1.encoding
puts euro1.bytesize
puts ""

euro2 = euro1.encode("iso-8859-15")
puts euro2.inspect
puts euro2.encoding
puts euro2.bytesize
puts ""

euro3 = euro2.encode("utf-8")
puts euro1 == euro3
puts ""
