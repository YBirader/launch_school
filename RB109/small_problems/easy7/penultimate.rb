=begin
Q: Write a method that returns the penultimate word in the String passed to it as an argument. Words are any sequence of non-blank characters.
   You may assume that the input string will contain at least two words.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string 
   OUTPUTS: the penultimate word in the input string
   
   PROBLEM DOMAIN:
   word- any sequence of non-blank characters
   
   RULES:
   - string will have at least two words
   - penultimate word def: word at string size -1, where index=0 for first word
   - case-insensitive operation
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given a string, return the penultimate word.

2) EXAMPLES/TEST CASES
   Input: 'hello yusuf'
   Output: 'hello'

   EDGE CASES:

3) DATA STRUCTURE
   split the string into an array of words

4) ALGORITHM
   1. split the string into an array of words
   2. return the word att index arr length - 2

5) CODE
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

=begin
write a method that returns the middle word of a phrase or sentence.

input: string
output: middle word

rules:
- if odd number of words, return middle
- if even return middle two words
- if input string empty, return empty string
=end

def middle(string)
  return '' if string.empty?
  words = string.split
  if words.size.even?
    words[(words.size / 2) - 1, 2].join(' ')
  else
    words[words.size / 2]
  end
end

p middle('hello') == 'hello'
p middle('hello this is yusuf birader.') == 'is'
p middle('this is yusuf birader') == 'is yusuf'
