puts "while"
x = 10
while x >= 0 do
  puts x
  x = x - 1
end

puts "\nuntil"
x = 0
until x > 10 do
  puts x
  x = x + 1
end

puts "\nwhile before"
x = 0
while x < 10 do puts x = x + 1 end

puts "\nwhile after"
x = 0
puts x = x + 1 while x < 10


a = [1,2,3]
puts "\npop on: #{a}"
puts a.pop until a.empty?

puts "\nUntil"
x = 10
begin
  puts x
  x = x - 1
end until x == 0

x = 0
(
  puts x
  x = x - 1
) until x == 0

array = [1,2,3,4,5]
puts "\nFor on array #{array}"
for element in array
  puts element
end

hash = {:a=>1, :b=>2, :c=>3}
puts "\nFor on hash #{hash}"
for key,value in hash
  puts "#{key} => #{value}"
end

hash = {:a=>1, :b=>2, :c=>3}
puts "\nEach on hash #{hash}"
hash.each do |key,value|
  puts "#{key} => #{value}"
end
