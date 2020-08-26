def range(number)
  if number < 0
    puts "No negative numbers!"
  elsif number <= 50
    puts "#{number} is between 0 and 50."
  elsif number > 100
    puts "#{number} is greater than 100."
  else
    puts "#{number} is between 51 and 100."
  end
end 

range(-1)
range(26)
range(53)
range(101)
