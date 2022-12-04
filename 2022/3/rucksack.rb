#!/usr/bin/env ruby

def val(char)
  # ascii ordinal offsets for a-z 1-26 and A-Z 27-52 
  char.ord > 90 ? char.ord - 96 : char.ord - 38
end

c = 0
line_num = 1
badge_lines = Array.new
badge_c = 0
STDIN.read.split("\n").each do |line|
  badge_lines[line_num % 3] = line.split('')
  if line_num % 3 == 0
    badge = (badge_lines[0] & badge_lines[1] & badge_lines[2]).first
    badge_c += val(badge)
  end
  mid = line.size / 2
  first_half = line[0,mid].split('')
  second_half = line[mid,line.size].split('')
  dupe = (first_half & second_half).first
  c += val(dupe)
  line_num += 1
end

puts "Total: #{c}\n"
puts "Badge total: #{badge_c}\n"
