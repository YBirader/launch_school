=begin
Q: Write a program that prompts the user for two integers and then prints the result of the following operations on those 2 numbers:
   addition, subtraction, product, remainder, power.

1) UNDERSTAND THE PROBLEM
   INPUTS:
   OUTPUTS:
   PROBLEM DOMAIN:
   RULES:
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

puts "Enter the first number:"
first_num = gets.chomp.to_i  # if floats, use #to_f

puts "Enter the second number:"
second_num = gets.chomp.to_i

puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"  # need to make sure second number is not zero => diverges to 00
puts "==> #{first_num} % #{second_num} = #{first_num.remainder(second_num)}"
puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"
