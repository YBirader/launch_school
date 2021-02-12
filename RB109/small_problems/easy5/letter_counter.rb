=begin
Q: Write a method that takes a string with one or more space seperated words and returns a hash that shows the numbers of words 
   of different sizes.

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
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given a space delimited string of words, find the length of each word in that string and 
                 the number of words in the strig with that length.

2) EXAMPLES/TEST CASES
   Input: 'yusuf is the best'
   Output: {5=>1, 2=>1, 3=>1, 4=>1}

   EDGE CASES:

3) DATA STRUCTURE
   split the string into an array of words, using spaces as the delimiter

4) ALGORITHM
   1. split the string into an array of words, called words, using the space delimiter
   2. create an empty hash called result = {} # {length => no of words with that length}
   3. find the number of words with a given length
        for each word in words
          if result has key word.length
            result[word.length] += 1
          else
            result[word.length] = 1
   4. return result

5) CODE
=end

# method 1

def word_sizes(string)
  result = {}
  string.split.each do |word|
    if result.has_key?(word.length)
      result[word.length] += 1
    else
      result[word.length] = 1
    end
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# method 2

def word_sizes(string)
  result = Hash.new(0)
  string.split.each do |word|
    result[word.length] += 1
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}