=begin
Q: Write a method that return true if the word passed in as an argument can be spelled from the set of given spelling block; false otherwise.


1) UNDERSTAND THE PROBLEM
   INPUTS: a word (string)
   OUTPUTS: Boolean
   
   PROBLEM DOMAIN:
   
   RULES:
   - spelling blocks contain two chars each
   - word spelling should be case-insensitve
   - return true if each char in word comes from different spelling blocks
   - return false if two chars in word come from the same spelling block

   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given a word, iterate through each char in the word. For the current_char, find the spelling block which contains it and delete it.
   If the spelling block cannot be found, return false, otheriwse return true.

2) EXAMPLES/TEST CASES
   Input: 'BANG'
   Output: false

   Input: 'BAP'
   Output: true

   EDGE CASES:

3) DATA STRUCTURE
   spelling blocks stored in a 2d array

4) ALGORITHM
   1. store the spelling blocks in a 2d nested array, where each element is a spelling block
   2. Iterate through word and find if any char comes from same block
        - for each char in word
            for each block in spelling_blocks
               if block includes char
                  delete char from block
               return false if block is empty
         return true


5) CODE
=end

def block_word?(word)
   spelling_blocks = [['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'], ['g', 't']] + 
                     [['r', 'e'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'], ['v', 'i']] + 
                     [['l', 'y'], ['z', 'm']]
   word.each_char do |char|
      spelling_blocks.each do |block|
         block.delete(char.downcase) if block.include?(char.downcase)
         return false if block.empty?
      end
   end
   true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# method 2

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
   up_string = string.upcase
   BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true