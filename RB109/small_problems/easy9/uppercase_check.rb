=begin
Q: Write a method that takes a string argument, and return true if all of the alphabetic characters inside the string are uppercase, false otherwise.
   Characters that are not alphabetic should be ignored

1) UNDERSTAND THE PROBLEM
   INPUTS: string
   OUTPUTS: Boolean
   PROBLEM DOMAIN:
   RULES:
   - alphabetic chars def: a..z
   - return true if char == uppercase char
   - ignore non-alpbaetic chars
   - return true if empty string input
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: return true if all the alphabetic chars in string are uppercase

2) EXAMPLES/TEST CASES
   Input: 'hello'
   Output: false

   Input: 'HELLO'
   Output: true

   EDGE CASES:
   Input: ''
   Output: true

3) DATA STRUCTURE
   split string into constituent chars in an array

4) ALGORITHM
   1. split string into constituent chars in an array called chars
   2. for each char in chars
        return false if char != downcase char
   3. return true

5) CODE
=end

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


def uppercase?(string)
  string.chars.all? { |char| char == char.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

def uppercase(string)
  string.each_char { |char| return false if char != char.upcase }
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true