=begin
Q: Given a string of words seperated by a space, write a method that takes the string of words and returns a string in which
   the first and last characters of every word are swapped. You may assume that every word contains at least one letter,
   and that the string will always contain at least one word. You may also assume that each string contains nothing but
   words and spaces.


1) UNDERSTAND THE PROBLEM
   INPUTS: string
   OUTPUTS: string, where first and last letters of every word are swapped
   
   PROBLEM DOMAIN:
   RULES:
   - the first letter and last letter of every word should be swapped.
   - swapping is case-insensitive
   - if word == single char, return word i.e. nothing to swap
   - first letter = word[0], last letter = word[-1]
   - string will contain at least one word
   - spaces are delimiter between words
   - swapping def- word[0] = last letter, word[-1] = first letter
   
   CLARIFYING QUESTIONS:
   Should I return the same string object or a new one? a new one

   MENTAL MODEL: Given a string, for each word in the string, swap the first and last chars. return the new string

2) EXAMPLES/TEST CASES
   Input: 'hello yusuf'
   Output: 'oellh fusuy'

   Input: 'a'
   Output: 'a'

   Input: 'daft'
   Output: 'tafd'

   EDGE CASES:

3) DATA STRUCTURE
   split the string into an array of words

4) ALGORITHM
   1. split the string into an array called words, using spaces as delimiters
   2. swap the first and last letters of each word
        - for each word in words
            create variable called first_letter = word[0]
            create variable called last_letter = word[-1]
            word[0] = last_letter
            word[-1] = first_letter
   3. join the words back to a string, where each word is delimited by a space

5) CODE
=end

def swap(string)
  words = string.split
  words.each do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
  end

  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# method 2

def swap_first_and_last_char(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  result = string.split.map do |word|
    swap_first_and_last_char(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
