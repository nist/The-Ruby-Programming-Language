#!/usr/bin/env ruby
# This class represents a sequence of numbers characterized by the three
# parameters from, to and by. The numbers x in the sequence obey The
# following constraints:
#
#   from <= x <= to
#   x = from + n*by, where n is an integer
#
class Sequence
  # This is an enumerable class; it defines an each iterator below.
  include Enumerable # Include the methods of this module in this class

  # The initialize method is special; it is automatically invoked to
  # initialize newly created instances of the class
  def initialize(from, to, by)
    # Just save our parameters into instance variables for later use
    @from, @to, @by = from, to, by
  end

  # This is the iterator required by the Enumerable module
  def each
    x = @from
    while x <= @to
      yield x
      x += @by
    end
  end

  def length
    return 0 if @from > @to
    Integer((@to - @from)/@by) + 1
  end

  alias size length

  def[](index)
    return nil if index < 0
    v = @from + index * @by
    if v <= @to
      v
    else
      nil
    end
  end

  def *(factor)
    Sequence.new(@from*factor, @to*factor, @by*factor)
  end

  def +(offset)
    Sequence.new(@from+offset, @to+offset, @by)
  end
end

s = Sequence.new(1, 10, 2)
print "s: "
s.each {|x| print x }
print "\n"
print "size: #{s[s.size-1]}\n"
t = (s+1)*2
print "t : #{t}\n"
