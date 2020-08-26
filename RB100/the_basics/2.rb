
  
  
  
print "Input a 4 digit number: "    
n = gets.chomp.to_i

thousand = n / 1000
hundreds = n % 1000 / 100
tens = n % 100 / 10
one = n % 10 
puts "Thousands: #{thousand.to_s}"
puts "Hundreds: #{hundreds.to_s}"
puts "Tens: #{tens.to_s}"
puts "One: #{one.to_s}"





  









  