#!/usr/bin/env ruby

parts = 2
input = STDIN.read
(1..parts).each do |part|
  stacks = Array.new
  input.split("\n").each do |line|
    if line =~ /\[.\]/
      line_a = line.split('')
      c = 1
      (1..(line_a.size)).each_slice(4) do |x|
        stacks[c] = [] unless stacks[c]
        stacks[c].push(line_a[x.first]) if line_a[x.first] =~ /[A-Z]/
        c += 1
      end
    elsif line =~ /^move ([0-9]+) from ([0-9]+) to ([0-9]+)/
      qty = $1
      from = $2
      to = $3
      case part
      when 1
        qty.to_i.times { stacks[to.to_i].insert(0,stacks[from.to_i].shift) }
      when 2
        stacks[to.to_i].insert(0,stacks[from.to_i].shift(qty.to_i)).flatten!
      end
    end
  end
  print "Part #{part}: "
  stacks.each {|stack| print stack.first if stack }
  puts "\n"
end
