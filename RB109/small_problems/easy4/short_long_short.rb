=begin
Q: Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of
   concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different length.

   1) UNDERSTAND THE PROBLEM
   INPUTS: a string of length, n and a string of length m, where n != m
   OUTPUTS: a concatenated string
   PROBLEM DOMAIN:
   RULES:
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM
   1. if n > m, return string(m)string(n)string(m)

5) CODE
=end

def short_long_short(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"