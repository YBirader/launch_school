=begin
Q: Create a mad-lib program that prompts for a noun, a verb, an adverb, and an adjective, and injects those into a story that you create.


1) UNDERSTAND THE PROBLEM
   INPUTS: a list of words
   OUTPUTS: a string (story)
   
   PROBLEM DOMAIN:
   RULES:
   - get noun, verb, adjective and adverb from user.
   - interpolate given words into the story
   - story def: Do you verb your adjective noun adverb? Thats hilarious!
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Get a noun, verb, adjective, adverb from the user. Then, interpolate these words in the correct positions in the story

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE
   create a hash to store the users words

4) ALGORITHM
   1. get the required words from the user
        - create a hash {noun: '', verb: '', adjective: '', adverb: '' }
        - get the words from the user and store in the hash
   2. interpolate the words into the story

5) CODE
=end

words = { noun: '', verb: '', adjective: '', adverb: '' }
words.keys.each do |word_type|
  puts "Enter a #{word_type}:"
  word = gets.chomp
  words[word_type] = word
end

sentence_1 = "Do you #{words[:verb]} your #{words[:adjective]} #{words[:noun]} #{words[:adverb]}? That's hilarious!"
sentence_2 = "The #{words[:adjective]} #{words[:noun]} #{words[:verb]}s #{words[:adverb]} over the lazy dog."
sentence_3 = "The #{words[:noun]} #{words[:adverb]} #{words[:verb]}s up #{words[:adjective]} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample



