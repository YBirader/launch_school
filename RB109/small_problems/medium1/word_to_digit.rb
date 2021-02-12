=begin
Q: Write a method that takes a sentence string as input, and returns the same string with any sequence of the words, 'zero', 'one', 'two',
   'three', 'four', 'five', 'six', 'seven', 'eight', and 'nine' converted to a string of digits.


1) UNDERSTAND THE PROBLEM
   INPUTS: space delimited string
   OUTPUTS: string, where number strings converted to digit strings
   
   PROBLEM DOMAIN:
   
   RULES:
   - convert ('zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' to digit string equivalents)
   - conversion def: if string includes number string, convert[string] = digit_string
   - number string conversion should be case-insensitive
   - non-alphabetic string e.g. punctuation marks may be part of number string
   - All non-number strings should be left alone.
   - must return the same string


   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given a string sentence, split the string into its constiuent words iterate through each word in the string. For the current word, build up the word character by character. If the
   building current word includes a number digit, convert it to its digit string equivalent. Otherwise, append the current word to a new array. Then, join
   the array using a space delimiter.

2) EXAMPLES/TEST CASES
   Input: 'I am four five miles away'
   Output: 'I am 4 5 miles away'

   Input: 'Please call me at five five five one two three four. Thanks.'
   Output: 'Please call me at 5 5 5 1 2 3 4. Thanks.'

   EDGE CASES:

3) DATA STRUCTURE
   split the string into constituent words into an array
   store the new words in an array
   store word to digit conversions in an array

4) ALGORITHM
destructive
   1. store word to digit conversions in an array
        - ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'] called conversion
   2. Substitute each number string for its corresponding digit string
        - for each number in conversion
            substitute number in string for index of number in conversion




non-destructive
   1. store word to digit conversions in an array
        - ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'] called conversion
   2. split string into its constituent words array called words
   3. convert each number word in words to digit word
        - create an empty array called result = []
        - for each word in words
            create a variable called current_word = ''
            for each char in word
              append char to current_word
              current_word = string version of current_word index in conversion if conversion includes current_word
            end
           append current_word to result
    4. join result using whitespace as a delimiter

          

5) CODE
=end

CONVERSION = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

def word_to_digit!(string)
  CONVERSION.each do |number|
    string.gsub!(/\b#{number}\b/, CONVERSION.index(number).to_s)
  end
  string
end


p word_to_digit!('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# non_destructive



def word_to_digit(string)
  result = string.split.map do |word|
    current_word = ''
    word.each_char do |char|
      current_word << char
      current_word = CONVERSION.index(current_word.downcase).to_s if CONVERSION.include?(current_word)
    end
    current_word
  end
  result.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
