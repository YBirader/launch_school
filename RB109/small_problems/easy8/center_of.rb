=begin
Q: Write a method that takes a non-empty string argument, and returns the middle char or chars of the argument. If the argument has 
   an odd length, return exactly one char. If the argument is even, then return exactly two chars


1) UNDERSTAND THE PROBLEM
   INPUTS: string
   OUTPUTS: middle char(s)
   
   PROBLEM DOMAIN:
   RULES:
   - string is non-empty
   - middle char def: if string size is odd, string[string size / 2], if string size is even, string[string size / 2 - 1..string size /2]
   - case-insensitive operation
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string, find the size of the string. If the string has an even length, return the two chars in the middle. If the string is odd, 
                 return the middle char.

2) EXAMPLES/TEST CASES
   Input: 'string'
   Output: 'ri'

   Input: 'x'
   Output: 'x'

   Input: 'yusuf'
   Output: 's'

   EDGE CASES:

3) DATA STRUCTURE
   use the index of strings

4) ALGORITHM
   1. return the middle char(s) of string
        - if string size is even
            return string[string size / 2 - 1, string size /2]
else
  return string[size / 2]

5) CODE
=end

def center_of(string)
  string.size.even? ? string[string.size / 2 - 1, 2] : string[string.size / 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'