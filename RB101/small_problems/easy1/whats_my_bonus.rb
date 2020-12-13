=begin
Q: Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
   If the boolean is true, the bounus should be half of the salary. If the bonus is false, the bonus should be 0.

1) UNDERSTAND THE PROBLEM
   INPUTS: positive integer 
   OUTPUTS: integer
   PROBLEM DOMAIN:
   RULES:
   1. if true, bonus = salary / 2 else bonus = 0
   2. bonus is always an integer.
   
   CLARIFYING QUESTIONS:
   assume valid inputs? yes
   MENTAL MODEL: if true, return half the salary, otherwise return 0.

2) EXAMPLES/TEST CASES
   Input: 2800, true
   Output: 1400

   Input: 1000, false
   Output: 0

   EDGE CASES:
   Input: 1, true
   Output: 0

3) DATA STRUCTURE

4) ALGORITHM
   0. if boolean == true
        salary / 2
else
  0

5) CODE
=end

def calculate_bonus(salary, boolean)
  boolean ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
