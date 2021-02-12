=begin
Q: Write a method that takes one argument, a string, and returns a new string 
   with the words in reverse order. 

1) UNDERSTAND THE PROBLEM
   
   INPUTS: a string
   OUTPUTS: the string in reverse order
   
   PROBLEM DOMAIN:
   reverse- where the last word of the string becomes the first and the first becomes the last, with all 
   others re-arranging accordingly.
   
   RULES:
   1. An empty input string returns string
   2. reverse means string[0] <-> string[n-1], string[2] <-> string[n-2] etc.
   3. Spaces in the original string are unchanged after reversion.
   4. Case of the words in the string is irrelevant.
   
   CLARIFYING QUESTIONS:
   1. Is punctuation reversed? yes
   
   MENTAL MODEL: Given a string sentence, return the sentence reversed.

2) EXAMPLES/TEST CASES
   Input: 'Hello World'
   Output: 'World Hello'

   EDGE CASES:
   Input: 'hello'
   Output: 'hello'

3) DATA STRUCTURE
   Store the string, split into individual words in an array.

4) ALGORITHM
   0. Split the string into an array, using spaces as a delimiter.
   1. reverse the array.
   2. Join the array, with one space as a delimiter
   3. return the string.

5) CODE
=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
