=begin
Q: Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have
   appended a space and the word length. Assume that words in the string are seperated by exactly one space.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: array
   
   PROBLEM DOMAIN:
   
   RULES:
   - input string is delimited by one space
   - word length = number of chars in word
   - delimiter of output: ' word_length'
   - include all char types in word length calculation

   CLARIFYING QUESTIONS:
   - return a new string object? yes
   
   MENTAL MODEL: Given a string, find the length of each word. Then, replace the original string space delimiter with a new delimiter, ' word_length',
   and return the new string.

2) EXAMPLES/TEST CASES
   Input: 'yusuf'
   Output: 'yusuf 5'

   EDGE CASES:

3) DATA STRUCTURE
   split the string into its constituent words in an array
   store word lengths of each word in an array

4) ALGORITHM
   1. split the string into its constituent words in an array called words, using ' ' as a delimiter
   2. generate an array called word_lengths
        - create an empty array called word_lengths
        - for each word in words
            append word length to word_lengths
   3. map each word with index in words to word + ' word_lengths[idx]'
           

5) CODE
=end

def word_lengths(string)
  words = string.split
  words.map.with_index { |word, idx| word + " #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
