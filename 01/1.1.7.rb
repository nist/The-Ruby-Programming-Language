#!/usr/bin/env ruby
print "\"Ruby\".match(/[Rr]uby/) : #{"Ruby".match(/[Rr]uby/)}\n"
print "\"12nmiu45689yu90\".match(/\d{5}/) : #{"12nmiu45689yu90".match(/\d{5}/)}\n"
print "(1..3)===3 : #{(1..3)===3}\n"
print "(1...3)===3 : #{(1...3)===3}\n"

print "birthyear : #{birthyear = 1984}\n"

generation = case birthyear
when 1946..1963 then "Baby Boomer"
when 1964..1977 then "Generation X"
when 1978..2000 then "Generation Y"
else nil
end

print "generation : #{generation}\n"

def are_you_sure?
  while true
    print "Are you sure ? [y/n]:"
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end

print "are_you_sure? : #{are_you_sure?}\n"
