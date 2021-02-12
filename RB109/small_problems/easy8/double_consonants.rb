=begin
Q: Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (aeiou) and non-alphabetic
   chars should not be doubled.


1) UNDERSTAND THE PROBLEM
   
   INPUTS: a string
   OUTPUTS: a string (only consonants doubled)
   
   PROBLEM DOMAIN:
   consonant- any char which is alphabetic and not a vowel (aeiou)
   
   RULES:
   - only consonants should be doubled
   - duplication is case-insensitive
   - return emptty string if inputt string is empty
   - return a new string object

   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string, iterate through each char. If the char is a consonant, duplicate it. Then, return the new string.

2) EXAMPLES/TEST CASES
   Input: 'yusuf'
   Output: 'yyussuff'

   EDGE CASES:
   Input: ''
   Output: ''

3) DATA STRUCTURE
   split the string into its consituent chars

4) ALGORITHM
   1. create a constant which includes consonants
        - create an array of alphabetic chars
        - reject all Vowels
   2. duplicate all consonantts in the string
       - split the string into chars
       - for each char in chars
           map char to char * 2 if char is a consonant
   3. return the new string
           

5) CODE
=end


CONSONANTS = Array('a'..'z').reject { |char| char.match(/[aeiou]/) }

def double_consonants(string)
  string.chars.map do |char|
    CONSONANTS.include?(char.downcase) ? char * 2 : char
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
