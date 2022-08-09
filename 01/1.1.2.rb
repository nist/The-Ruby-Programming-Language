#!/usr/bin/env ruby
print "\nIteration : \n"
3.times { print "Ruby! " }
print "\n"
1.upto(9) { |x| print x }
print "\n"

print "\nArray : \n"
a = [3, 2, 1]
a[3] = a[2] - 1
a.each do |elt|
  print elt+1
end
print "\n"

a = [1,2,3,4]
b = a.map { |x| x*x }
c = a.select { |x| x%2==0 }
a.inject do |sum,x|
  sum + x
end
print "a : #{a} \n"
print "b : #{b} \n"
print "c : #{c} \n"

print "\nHash : \n"
h = {
  :one => 1,
  :two => 2
}
print "h #{h}\n"
print ":one #{h[:one]}\n"
h[:three] = 3
h.each do |key,value|
  print "#{key}:#{value}; "
end

print "\n\nFile : \n"
File.open("data.txt") do |f|
  line = f.readline
  print line
end

print "With a thread :"
t = Thread.new do
  File.read("data.txt")
end
print "\nThread: #{t.value}\n"
