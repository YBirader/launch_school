=begin
Q: Write a method that takes a string as an argument and returns a new string in which every uppercase latter is replaced by its 
   lowercase version, and every lowercase version by its uppercase version. All other characters shoud be left unchanged.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a string (where alphabetic chars have their cases swapped)
   
   PROBLEM DOMAIN:
   RULES:
   - all alphabetic chars should have their cases swapped
   - alphabetic char def: any char between a-zA-Z 
   - if alphabetic char is lowercase, map to uppercase else map to lowercase
   - do not change non-alphabetic chars
   - words are whitespace-delimited
   
   CLARIFYING QUESTIONS:
   return a new object? yes
   MENTAL MODEL: given a string, split the string into its constueent words. Then, swap the cases of each alphabetic char
                 in each word and join the words back into a string.

2) EXAMPLES/TEST CASES
   Input: 'HelLo YuS-f'
   Output: 'hELlO yUs-F'

   EDGE CASES:

3) DATA STRUCTURE
   split string into constituent words, which are space delimited.

4) ALGORITHM
   1. split string into constitunent chars
   2. swap case of each alphabetic char
        - for each char in char
            map char to downcase if char is alphabetic uppercase
            map char to uppercase if char is alphabetic downcase
   else leave char unchanged
    2. join chars together, with no delimiter

5) CODE
=end

LOWERCASE_ALPHABETIC_CHARS = Array('a'..'z')
UPPERCASE_ALPHABETIC_CHARS = Array('A'..'Z')

def swapcase(string)
  chars = string.chars.map do |char|
    if UPPERCASE_ALPHABETIC_CHARS.include?(char)
      char.downcase
    elsif LOWERCASE_ALPHABETIC_CHARS.include?(char)
      char.upcase 
    else
      char
    end
  end
  chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

