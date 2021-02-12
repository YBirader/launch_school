=begin
Q: Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. 
Sentences may end with periods (.), exclamation points (!), or question marks (?). 
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
You should also print the number of words in the longest sentence.

1) UNDERSTAND THE PROBLEM
   INPUTS: a sentence (string)
   OUTPUTS: longest sentence in string, number of words in longest sentence
   
   PROBLEM DOMAIN:
   
   RULES:
   - find longest sentence in string
   - word = any char not including spaces and end of sentence markers i.e. ?, !, .
   - word count def: add to count unless char == '.', ' ', '?', '!'
   - sentence def: any alphanumeric char and ends with either ?/./!

   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string of sentences, split the string into an array, where each element is a sentence. Then, iterate over the array.
   If the current sentence has a word count equal or greater than any previous sentence, save it. Then, find the word count of this sentence
   and return the sentence and the word count.

2) EXAMPLES/TEST CASES
   Input: 'hello this is yusuf. How are you?'
   Output: 'hello this is yusuf.', 4

   EDGE CASES:

3) DATA STRUCTURE
   split the string of sentences into an array

4) ALGORITHM
   1. split the string into an array, where each element is a sentence
   2. Count the number of words in a sentence
        - split the sentence into an array of words via a space delimiter
        - count = size of array
   2. find the sentence with the largest word count
        - create a variable called memo = ''
        - for each sentence in sentences
            memo = sentence if word count of sentence >= memo word count
   3. Compute the word count of the largest sentence
       - count the number of words in sentence
   4. return memo and count of memo


5) CODE
=end

def count_words(sentence)
  sentence.split.size
end


def longest(string)
  sentences = string.split(/\.|\?|\!/)
  longest_sentence = sentences.inject('') do |memo, sentence|
    if count_words(memo) < count_words(sentence)
      memo = sentence
    else
      memo
    end
  end
  puts longest_sentence.lstrip
  puts count_words(longest_sentence)
end

text1 = File.read('longest_sentence1.txt')
text2 = File.read('longest_sentence2.txt')

longest(text1)
longest(text2)



# method 2

def longest(string)
  sentences = string.split(/\.|\?|\!/)
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }.strip
  longest_sentence_word_count = longest_sentence.split.size
  puts longest_sentence
  puts longest_sentence_word_count
end

longest(text1)
longest(text2)

# further_exploration

def longest_word(string)
  words = string.split
  puts longest_word = words.max_by { |word| word.size }.gsub(/\.|\?\\!/, '')
  puts longest_word.size
end

longest_word('hello this is yusuf.')
