=begin
: Write a method that takes a string, and then returns a hash that contains 3 entries; one representing the percentage of characters in the string
   that are lowercase letters, one the percentage of characaters that are uppercase letters, and one the percentage of characters that are neither.
   Assume that the input string always contains at least one characeter.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   
   OUTPUTS: a hash
   
   PROBLEM DOMAIN:
   
   RULES:
   - in general, string contains lowercase, uppercase and non-alphabetic (no case) letters
   - percentage of lowercase def: (no of lowercase / total number of chars) * 100
     percentage of uppercase def: (no of uppercase / total number of chars) * 100
     percentage of no case def: (no of no case / total number of chars) * 100
   - lowercase letters def: char is lowercase if char is included in ('a'..'z')
   - uppercase letter def: char is uppercase if char is included in ('A'..'Z')
   - no case letter def: total_chars - uppercase - lowercase
   - hash has keys as names and values as percentages
   - percentages are to floats, where any trailing zeros are removed.


   CLARIFYING QUESTIONS:

   MENTAL MODEL: Given a string, find the number of uppercase chars, find the number of lowercase chars, find the number of no case chars and find the total
   number of chars. Then calculate the relevant % ratios which in general are floats. Format the ratios such that any trailing zeros are removed.

2) EXAMPLES/TEST CASES
   Input: 'Hh'
   Output: { lowercase: 50, uppercase: 50, neither: 0 }

   EDGE CASES:

3) DATA STRUCTURE
   store results in a hash

4) ALGORITHM
   1. Find the total number of chars
        no of chars = string size
   2. Find the total no of lowercase & uppercase & neither case chars
   3. Find the relevant ratios
      - lowercase = no of lowercase/total no of chars * 100 as flt
      - uppercase = no of uppercasecase/total no of chars * 100 as flt
      - no case = 100 - upperratio- lowercaseratio
   4. format ratios
      - if ratio as integer == ratio as floats
          ratio = ratio as integer
else
  ratio


5) CODE
=end

def format(ratio)
  ratio == ratio.to_i ? ratio.to_i : ratio
end

def letter_percentages(string)
  total_chars = string.size
  lowercase_chars_ratio = (string.count('a-z') / total_chars.to_f) * 100
  uppercase_chars_ratio = (string.count('A-Z') / total_chars.to_f) * 100
  neither_ratio = 100 - lowercase_chars_ratio - uppercase_chars_ratio

  { lowercase: format(lowercase_chars_ratio), uppercase: format(uppercase_chars_ratio), neither: format(neither_ratio) }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }



def format(ratio)
  ratio == ratio.to_i ? ratio.to_i : ratio
end

def letter_percentages(string)
  total_chars = string.size
  lowercase_chars_ratio = (string.count('a-z') / total_chars.to_f) * 100
  uppercase_chars_ratio = (string.count('A-Z') / total_chars.to_f) * 100
  neither_ratio = 100 - lowercase_chars_ratio - uppercase_chars_ratio

  { lowercase: lowercase_chars_ratio.round(2), uppercase: uppercase_chars_ratio.round(2), neither: neither_ratio.round(2) }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }