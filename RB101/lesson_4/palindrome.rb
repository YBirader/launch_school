=begin
Q: Given a string, write a method called change_me, which returns the same string but with all the words in it that are palindromes uppercased.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a string with all the words in it that are palindromes uppercased (not the same object)
   
   PROBLEM DOMAIN:
   Palindrome- a word, number, phrase or sequences of characters that reads the same forwards as backwards.
   
   RULES:
   0. palindrome if string == reversed_string
   1. Only individual words need to be considered, not phrases, sequences of characters or numbers 
   2. Upper-case characters/words in the string which may or may not be palindromes should be left untouched 
   3. if no palindromes or empty string, return the original string 
   4. Palindromes are case-sensitive e.g. "Dad" is not a palindrome but 'dad' is.
   
   CLARIFYING QUESTIONS:
   1. Are phrases considered palindromes? No only individual words
   2. Do I need to consider numbers? No the string will consists of chars only
   3. Can the input be a non-string? no, only strings
   4. Do I need to return the same string object or a new object? a new object
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES
   Input: "We will meet at noon"
   Output: "WE will meet at NOON."

   Input: "No palindromes here"
   Output: "No palindromes here"

   Input: "I LOVE my mum and dad equally"
   Output: "I LOVE my MUM and DAD equally"

   EDGE CASES:
   Input: ''
   Output: ''

3) DATA STRUCTURE
   an array to parse the string into its individual words
   each element of the array should be a string
   an array to store the final output string

4) ALGORITHM
  0. if string is empty, return string
  1. create an empty array called palindrome
  2. split the string using space as a delimiter into an array called words
  3. for each word in words
       - if word == reversed word
           append uppercase word to palindrome
       - else append word to palindrome
  4. join palindrome elements with spaces in between each word and return

5) CODE
=end

def change_me(string)
  return string if string.empty?
  palindrome = []
  words = string.split(' ')
  words.each do |word|
    if word == word.reverse 
      palindrome.push(word.upcase)
    else
      palindrome.push(word)
    end
  end
  
  palindrome.join(' ')
end

puts change_me("We will meet at noon")
puts change_me("No palindromes here")
puts change_me("I LOVE my mum and dad equally")
puts change_me('')

