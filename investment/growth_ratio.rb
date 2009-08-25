#!/usr/bin/env ruby

require 'logger'

@logger = Logger.new(STDOUT, 3, 1024000)
@logger.level = Logger::INFO

def calculate_growth_ratio(numbers)
  ret = []
  prev = 0
  numbers.each_with_index do |it, index|
    ret << ((it-prev) / prev) * 100 if prev != 0
    prev = it
  end
  ret
end

calculate_growth_ratio([1, 1.1, 1.21]).each do |it|
  puts it
end