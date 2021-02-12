=begin
Q: Write a method that takes an integer argument, and returns an Array of all integers, in sequence between 1 and the argument.
   Assume the argument will always be greater than 0.

1) UNDERSTAND THE PROBLEM
   INPUTS: number
   OUTPUTS: array (int elements from 1 to num inclusive)
   
   PROBLEM DOMAIN:
   
   RULES:
   - array has integer elements from 1 to num inclusive
   - array has num elements
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def sequence(number)
  number > 0 ? (1..number).to_a : (number..0).to_a
end
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
