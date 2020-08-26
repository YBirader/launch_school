print "how old are you? "
age = gets.chomp.to_i
10.step(40, 10) do |i|
  puts "In #{i} years, you will be:"
  puts age + i
end 













