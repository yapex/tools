#!/usr/bin/env ruby

def discounted_values(cash, discounted_rate, growth_rate=0, years=10)
  result = []
  years.times do |i|
    value = cash*((1+growth_rate)**i)
    result << [value, value/((1+discounted_rate)**i)]
  end
  result
end

def discounted_pv(cash, discounted_rate, growth_rate=0.03, years=10)
  value = cash * (1 + growth_rate) / (discounted_rate - growth_rate)
  value / ((1 + growth_rate) ** years)
end

def dcf(cash, discounted_rate, v_growth_rate=0, pv_growth_rate=0.03, years=10)
  values = discounted_values(cash, discounted_rate, v_growth_rate, years)
  pv = discounted_pv(cash, discounted_rate, pv_growth_rate, years)
  
  total_value = 0
  total_discounted_value = 0
  values.each_with_index do |it, index|
    puts "#{index}:\t%3d   %3d" % it
    total_value += it[0]
    total_discounted_value += it[1]
  end
  
  puts "total:\t %3d   %3d" % [total_value, total_discounted_value]
  puts "dcf: %3f" % [total_discounted_value + pv]
  
  total_discounted_value + pv
end

dcf(630, 0.09, 0.05, 0.03)

