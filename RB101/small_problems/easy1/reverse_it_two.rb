=begin
Q: Write a method that takes one argument, a string containing one or more words, and returns the given string 
with words that contain five or more characters reversed. Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present

1) UNDERSTAND THE PROBLEM
   INPUTS: a string, containing one or more words
   OUTPUTS: a the string with some words reversed.
   
   PROBLEM DOMAIN:
   reverse- the individual characters of a word in the string are swapped, where the first character
   in the word becomes the last and vice versa, with all others characters arranging accordingly.
   
   RULES:
   0. string only contains letters and spaces 
   1. only words with 5 or more letters are reversed
   2. spaces included only if string has more than one word
   3. upper-case is treated the same as lower-case
   4. The overall sentence is not reversed, only individual words.

   CLARIFYING QUESTIONS:
   1. What if empty or string consisting of only spaces are given? return empty string with no spaces

   MENTAL MODEL: For each word in a string with length greater or equal to 5, reverse the word. If there is more
   than one word, include spaces, otherwise, return the reversed word without spaces.

2) EXAMPLES/TEST CASES
   Input: 'Professional'
   Output: 'lanoisseforP'

   Input: 'Walk around the block'
   Output: 'Walk, dnuora the kcolb'

   EDGE CASES:
   Input: ''
   Output: ''

   Input: '  '
   Output: ''

3) DATA STRUCTURE
   Store the split string in an array called words
   Store the split word into an array called characters
   Store final reversed strings in array called reversed_string

4) ALGORITHM
  0. split the string into an array called words
  1. for each word in words
       if word.length >= 5 
        split word into array called characters
        reverse characters
        join characters and append to reversed_words
       else
        append to reversed_words
  2. join array using space delimiter in local variable, reversed_string
  3. return reversed_string


5) CODE
=end



def reverse_words(string)
  reversed_words = []
  string.split.each do |word|
    word.reverse! if word.length >= 5
    reversed_words.push(word)
  end
  reversed_words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

