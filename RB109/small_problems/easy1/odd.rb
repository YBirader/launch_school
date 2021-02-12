=begin
Q: Write a method that takes one integer argument, which may be positive, negative or zero. This method returns true
   if the numbers absolute value is odd. You may assume that the argument is a valid integer value.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer
   OUTPUTS: Boolean
   
   PROBLEM DOMAIN:

   RULES:
   1. The integer can be positive, negative or zero, but is always valid.
   2. odd = num.abs % 2 != 0
   
   CLARIFYING QUESTIONS:
   1. Is 0 considered an odd number? Yes
   MENTAL MODEL: If the absolute value of the input integer is odd, then return true. Else, return false.

2) EXAMPLES/TEST CASES
   Input: -3
   Output: true

   Input: 0
   Output: false

   EDGE CASES:
   
3) DATA STRUCTURE

4) ALGORITHM
   1. Determine the absolute value of number
   2. if number.abs % 2 != 0
        return true
   else
    return false

5) CODE
=end

def is_odd?(number)
  number.abs % 2 != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

def is_odd_again?(number)
  number.remainder(2) != 0
end


