=begin
Q: In this task, you have to find the presence of vowels in all possible substrings of the given string.
For each given string, you have to print the total number of vowels.
For example, if the input string is 'baceb', the substrings are 'b', 'ba', 'bac', 'bace', 'baceb', 'a', 'ac',
'ace', 'aceb', 'c', 'ce', 'ceb', 'e', 'eb', 'b' and the number of vowels in each substring are 0, 1, 1, 2, 2,
1, 1, 2, 2, 0, 1, 1, 1, 1, 0 and the total number of vowels in all substring is 16.

1) UNDERSTAND THE PROBLEM
   INPUTS: 
   a string
   OUTPUTS:
   the total number of vowels in all substrings of the input string.
   
   PROBLEM DOMAIN:
   vowel- A vowel refers to the letters, aeiouAEIOU
   RULES:
   i) A substring can be repeated.
   ii) A repeated substrings vowels are included in the sum.
   iii) Substrings are formed relative to the letters to the right of the given character.
   iv) lower case and upper case vowels are considered the same.
   
   CLARIFYING QUESTIONS:
   i) What are vowels? They are aeiouAEIOU
   ii) What is a substring? letter/words formed to the right of the chosen character
   iii) No input given? return 0
   
   MENTAL MODEL: 
   Determine all the substrings of a given string. Then, find the number of vowels in each substring and compute and return
   the sum of the number of vowels from each substring. 

2) EXAMPLES/TEST CASES
   i) Input: 'baceb'
      Output: 16
   ii) Input: ''
       Output: 0
   iii) Input: 'aabbcc'
        Output: 16

   EDGE CASES:
   i) Input: 'BACeb'
      Output: 16
      

3) DATA STRUCTURE
Store the string in an array called string
Store the vowels in an array called vowels
Store the substrings of the string in an array called substrings
Store the vowel_count in a local variable called vowel_count

4) ALGORITHM
0. Create an array called split_string, which has contains a split string.
1. Create an array called vowels, which contains each vowel character, in both lower case and upper case.
2. Create an empty array called substrings, that will contain the substrings of string.
3. Intialise a local variable called counter = 0, which will define the range of characters considered relative to the reference character.
4. for character in string
    while counter < length_of_string
      append string[character..counter] to substrings
      increment counter by 1 
5. for each string in substring 
     count the number of vowels and add the amount to vowel count
6. return vowel_count

5) CODE
=end

def count_vowels(string)
  split_string = string.split('')
  vowels = %w(a e i o u)
  substrings = []
  vowel_count = 0

  split_string.each_with_index do |_, reference_character|
    counter = 0
    while counter < string.length
      substrings.push((split_string[reference_character..counter]).join)
      counter += 1
    end
  end

  substrings.join.each_char do |character|
    vowel_count += 1 if vowels.include?(character.downcase)
  end

  vowel_count
end

p count_vowels('abce')

