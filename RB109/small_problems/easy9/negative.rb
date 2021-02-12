=begin
Q: Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0
   or a negative number, return the original number.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer
   OUTPUTS: integer
   
   PROBLEM DOMAIN:
   RULES:
   - if number > 0, return number * -1. if number <= 0, return number
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# further exploration

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0 