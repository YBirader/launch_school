=begin
Q: write a method that takes two arguments, a string and a positive integer, and prints the string 
   as many times as the integer indicates.
1) UNDERSTAND THE PROBLEM
   INPUTS: the string, an integer
   OUTPUTS: the string, written as many times as the integer.
   
   PROBLEM DOMAIN: 
   RULES:
   1) All numbers are integers
   2) The number will always be positive 
   3) Upper and lower case strings are treated the same.
   CLARIFYING QUESTIONS: 
   1) What if no string is given? Assume valid string
   2) Will the ineteger be in string format? No the integer will be an actual integer.
   3) What if the number is 0? Asssume integer >= 1.
   
   MENTAL MODEL: Given an number, n, print the string out n times.

2) EXAMPLES/TEST CASES
   1) Input: 'Hello', 3
      Output: 'Hello'
              'Hello'
              'Hello'

   EDGE CASES:
   Input: 'HELLO', 3
   Output: 'HELLO'
           'HELLO'
           'HELLO'
          

3) DATA STRUCTURE

4) ALGORITHM
   1. Check if string is valid i.e. not empty
   2. Check if integer is valid
   3. print string n times
     
5) CODE
=end

def repeat(string, n)
  n.times { |i| puts string }
end

repeat('hello', 3)
repeat('HELLO', 3)
repeat('HeLlo', 3)


