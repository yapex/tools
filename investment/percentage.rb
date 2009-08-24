#!/usr/bin/env ruby

require 'logger'

@logger = Logger.new(STDOUT, 3, 1024000)
@logger.level = Logger::DEBUG

def calculate_percentage(numbers)
  total = 0
  numbers.each do |number|
    total += number
  end
  @logger.debug "total: #{total}"
  ret = []
  numbers.each do |number|
    ret << (number.to_f * 100 / total)
  end
  ret
end


calculate_percentage([1,2,3,4,5,6]).each do |it|
  puts "#{it}%"
end