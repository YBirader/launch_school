=begin
Q: Write a method that takes a string argument and returns a new string that contains the value of the original
   string with all consecutive duplicate characters collapsed into a single character.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string (which contains duplicate chars)
   OUTPUTS: a string (where all duplicate chars are collapsed into one)
   PROBLEM DOMAIN:
   duplicate characters- a continguous set (more than one) of the same character. 
   RULES:
   - need to return a new string
   - collapse duplicate chars into a single char 
   - duplicate char: string[i], string [i + 1], .. are all ==  char
   - return empty string if original string empty.
   CLARIFYING QUESTIONS:
   assume valid input? yes
   MENTAL MODEL: Given a string, iterate through every character. If the current character is repeated consecutively,
                 then delete all additional consecutive occurences of that char and return the new string

2) EXAMPLES/TEST CASES
   Input: 'hello'
   Output: 'helo'
   EDGE CASES:
   Input: ''
   Output: ''

3) DATA STRUCTURE
   string of chars

4) ALGORITHM
   1. Delete all duplicate instances of current_char
       - create variable called crunched_string = ''
       - for each char in string
           append char to crunched string unless last char of crunched_string == char
    2. return crunched_string
           

5) CODE
=end

def crunch(string)
  crunched_string = ''
  string.each_char do |char|
    crunched_string << char unless char == crunched_string[-1]
  end
  crunched_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''