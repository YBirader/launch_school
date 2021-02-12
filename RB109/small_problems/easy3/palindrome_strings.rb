=begin
Q: Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.

1) UNDERSTAND THE PROBLEM
   INPUTS: string
   OUTPUTS: Boolean
   PROBLEM DOMAIN:
   palindrome- a string that reads the same forwards as it does backwards. It is case-sensitive and space and punctuation matter.
   RULES:
   - palindrome: string == string.reverse 
   CLARIFYING QUESTIONS:
   1. assume valid input? yes
   2. empty string- return false
   MENTAL MODEL: Given a string, return true if the string is a palindrome

2) EXAMPLES/TEST CASES
   Input: 'dad'
   Output: true

   EDGE CASES:
   Input: ''
   Output: 'false'

3) DATA STRUCTURE
   string

4) ALGORITHM
   1. string == string.reverse, return true

5) CODE
=end

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true