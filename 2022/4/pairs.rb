#!/usr/bin/env ruby

c = d = 0
s_a = []
STDIN.read.split("\n").each do |line|
  line.split(',').each_with_index { |s, i| s_a[i] = (s.split('-')[0]..s.split('-')[-1]).to_a }
  c += 1 if ( (s_a[0] - s_a[1]).empty? || (s_a[1] - s_a[0]).empty? )
  d += 1 if ( ! (s_a[0] & s_a[1]).empty? )
end
puts "Answers: #{c} #{d}"
