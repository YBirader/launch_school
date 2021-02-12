=begin
Q: Write a method that takes a string with one or more space seperated words and returns a hash that shows the numbers of words 
   of different sizes. Exclude non-alphabetic chars when determining word size.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string (space delimited)
   OUTPUTS: a hash (length => no of word with that length)
   PROBLEM DOMAIN:
   RULES:
   - string is space delimited
   - hash is { length => no of words with that length }
   - add lengths to hash as that word length is encountered. hsh is not ordered as a function of length.
   - case-insensitive operation
   - return empty hassh for empty string input
   - only count alphabetic chars i.e. char is alphabetic if ('a'..'z') includes char
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given a space delimited string of words, find the length of each word in that string and 
                 the number of words in the string with that length.

2) EXAMPLES/TEST CASES
   Input: 'yusuf is the best'
   Output: {5=>1, 2=>1, 3=>1, 4=>1}

   EDGE CASES:

3) DATA STRUCTURE
   split the string into an array of words, using spaces as the delimiter
   store the alphabetic chars in an array

4) ALGORITHM
   1. split the string into an array of words called words
   2. create a hash called tally, where the default value is set to 0
   2. find the length of each word, counting only alphabetic chars
        - for each word in words
        create a variable called count = 0
            for each char in word
              count += 1 if downcase char is alphabetic
            end
            tally[count] += 1
    3. return tally

          

5) CODE
=end

# method 1

ALPHABET = ('a'..'z').to_a

def word_sizes(string)
  tally = Hash.new(0)
  string.split.each do |word|
    count = 0
    word.each_char do |char|
      count += 1 if ALPHABET.include?(char.downcase)
    end
    tally[count] += 1
  end
  tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}


# method 2

def word_sizes(string)
  tally = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    tally[clean_word.length] += 1
  end
  tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
