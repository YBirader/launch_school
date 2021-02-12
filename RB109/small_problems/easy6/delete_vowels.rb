=begin
Q: Write a method that takes an array of strings, and returns an array of the same string values, except with the
   vowels aeiou removed.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array of strings
   OUTPUTS: an array of strings (with no vowels)
   PROBLEM DOMAIN:
   vowels- characters included in aeiou
   RULES:
   - vowels = aeiou
   - remove vowels from each string element: if aeiou includes downcased char_of_string, remove char_of_string
   - case-insenstive- need to remove both upper and lowercase vowels
   - remove all vowels even if repeated
   
   CLARIFYING QUESTIONS:
   should I return a new array? yes return a new array.
   Should i consider invalid input? No.
   MENTAL MODEL: Given an set of strings, remove any vowels in each string. Then return a new set with these strings.

2) EXAMPLES/TEST CASES
   Input: ['yusuf']
   Output: ['ysf']


   EDGE CASES:
   Input: ['']
   Output: ['']

3) DATA STRUCTURE
   create a new array to store new, non-vowel strings

4) ALGORITHM
   1. create an array called vowels with one element; aeiou
   2. remove any vowels in the string elements of array
        - for each string in array
            for each char in string
              reject all downcased chars that are included in vowels
              join chars into new string
           save these new strings in an array called new_strings
    3. return new strings

5) CODE
=end

# method 1

VOWELS = %(a e i o u)

def remove_vowels(strings)
  strings.map do |string|
    string.chars.reject { |char| VOWELS.include?(char.downcase) }.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# method 2

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# method 3

def remove_vowels(strings)
  strings.map { |string| string.gsub(/[aeiouAEIOU]/, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
