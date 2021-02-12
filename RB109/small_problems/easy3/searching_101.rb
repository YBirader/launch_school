=begin
Q: Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first
   5 numbers
3) DATA STRUCTURE
array to store solicited numbers

4) ALGORITHM
  1. get 6 numbers from the user and store the forst 5 in an array called integers
  2. if sixth integer included in integers puts yes else no

5) CODE
=end

# method 1

integers = []

puts ">> Enter the 1st number:"
integers << gets.chomp.to_i


puts ">> Enter the 2nd number:"
integers << gets.chomp.to_i

puts ">> Enter the 3rd number:"
integers << gets.chomp.to_i

puts ">> Enter the 4th number:"
integers << gets.chomp.to_i

puts ">> Enter the 5th number:"
integers << gets.chomp.to_i

puts ">> Enter the last number:"
check_int = gets.chomp.to_i

if integers.include?(check_int)
   puts "The number #{check_int} appears in #{integers}."
else
   puts "The number #{check_int} does not appear in #{integers}."
end

# method_2

number_label = %w(1st 2nd 3rd 4th 5th last)
numbers = []

number_label.each do |label|
   puts "Enter the #{label} number:"
   numbers << gets.chomp
end

sixth_int = numbers.pop
if numbers.include?(sixth_int)
   puts "The number #{sixth_int} does not appear in #{numbers}."
else
   puts "The number #{sixth_int} does not appear in #{numbers}."
end