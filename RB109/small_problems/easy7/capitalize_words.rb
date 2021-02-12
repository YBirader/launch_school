=begin
Q: Write a method that takes a single String argument and returns a new string that contains the original value of the argument
   with the first character of every word capitalized and all other letters lowercase. You may assume that words are any sequence
   of non-blank characters.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a string (first char of every word capitalized)
   
   PROBLEM DOMAIN:
   
   RULES:
   - capitalize first char of every word.
   - exclude words where first char is non-alphabetic
   - whitespace delimits words in the string
   
   CLARIFYING QUESTIONS:
   return a new String object? yes
   
   MENTAL MODEL: Given a String, split the string into its constituent words and capitalize the first char of every word.

2) EXAMPLES/TEST CASES
   Input: 'hello yusuf'
   Output: 'Hello Yusuf'

   EDGE CASES:

3) DATA STRUCTURE
   split the words of the string into an array

4) ALGORITHM
   1. split the words of the string into an array called words, using whitespace as delimiter
   2. capitalize the first char of every word
        - for each word in words
            map word to word, where first char is uppercase

5) CODE
=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap(string)
  string.downcase.split.each_with_object([]) do |word, arr|
    word[0] = word[0].upcase
    arr << word
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
