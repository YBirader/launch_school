=begin
Q: Write a methid that takes a string, and returns a new string in which every character is doubles.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a string (where every char is doubled)
   
   PROBLEM DOMAIN:
   RULES:
   - replace every char with its duplicate
   - duplicate char def: char * 2
   - duplication applies to all chars and is case-insensitive
   - return empty string if input string is empty.
   - output must be a new string
   
   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given a string, iterate through every char in the string. Create a list with a duplicated char as elements. Then join
                 to create a new string

2) EXAMPLES/TEST CASES
   Input: 'yusuf'
   Output: 'yyuussuuff'

   EDGE CASES:
   Input: ''
   Output: ''

3) DATA STRUCTURE
   store the duplicate chars in an array

4) ALGORITHM
   1. create an array of duplicate chars of string
        - create an empty array called duplicates = []
        - for each char in string
            append char * 2 to duplicates
   2. join duplicates to create a new string

5) CODE
=end

def repeater(string)
  string.each_char.with_object([]) do |char, duplicates|
    duplicates << (char * 2)
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# method 2

def repeater(string)
  string.chars.inject('') { |new_string, char| new_string += char*2 }
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# method 3

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''