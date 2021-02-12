=begin
Q: Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a 
   method that returns that string with all of the non-alphabetic chars replaced by spaces. If one or more non-alphabetic
   chars occur in a row, you should only have one space in the result i.e the result should never have consecutive spaces.


1) UNDERSTAND THE PROBLEM
   INPUTS: string (which includes non-alphabetic chars)
   OUTPUTS: string (all non-alphabetic char(s) replaced by a single space)
   PROBLEM DOMAIN:
   alphabetic char- a character includes in a..z
   RULES:
   - all words are lowercase 
   - non-alpabetic chars are those that are not included in (a..z)
   - if non-alphabetic char or row of non-alphabetic char, replace with single space
   - should never have consecutive spaces
   - output should be all lowercased
   
   CLARIFYING QUESTIONS:
   - should a new object be returned? yes, a new object should be returned
   - empty input? assume all input is non-empty.
   
   MENTAL MODEL: Given a string, replace all of the non-alphabetic char(s) with a single space.

2) EXAMPLES/TEST CASES
   Input: 'he?llo'
   Output: 'he llo'

   Input: "I'm clean--g up"
   Output: "I m clean g up"

   EDGE CASES:

3) DATA STRUCTURE
   store clean_string in an array

           

4) ALGORITHM
  1. split string into an array called chars, consisting of individual chars
   2, create an empty array called clean_string = []
   2. replace each non-alphabetic chars with a single space
      - for each char in chars
          if char is alphabetic
            append char to clean_string
          else
            append ' ' unless clean_string[-1] == ' '
   3. join clean_string together, with no delimiter and return
   

5) CODE
=end

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_string = []
  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_string << char
    else
      clean_string << ' ' unless clean_string[-1] == ' '
    end
  end
  clean_string.join
end

p cleanup("---what's my +*& line?") == ' what s my line '

# method 2

def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

