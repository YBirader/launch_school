=begin
Q: Write a method that takes one argument, a postive integer, and returns the sum of its digits.

1) UNDERSTAND THE PROBLEM
   INPUTS: a positive integer
   OUTPUTS: sum of integer digits
   
   PROBLEM DOMAIN:
   
   RULES:
   1. integer can be written with underscores
   2. All numbers are psoitive integers

   CLARIFYING QUESTIONS:
   Ignore invalid input? yes
   MENTAL MODEL: sum the consituent digits of a positive integer

2) EXAMPLES/TEST CASES
   Input: 23
   Output: 5

   Input: 123_456_789
   Output: 45

   EDGE CASES:
   Input: 2
   Output: 2

3) DATA STRUCTURE
   Store the split integer as an array, with each digit elements

4) ALGORITHM
   0. Convert the integer into a string and split it into an array called 'digits'
   1. Convert each digit into an integer and sum all elements
   2. return the sum

5) CODE
=end

def sum(int)
  int.to_s.split(//).map(&:to_i).inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

