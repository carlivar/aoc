#!/usr/bin/env ruby

input = STDIN.read.split('')

[[1,4],[2,14]].each do |part|
  (0..input.size).each do |i|
    if input[i,part[1]].uniq.size == part[1]
      puts "Part #{part[0]}: #{i + part[1]}"
      break
    end
  end
end

