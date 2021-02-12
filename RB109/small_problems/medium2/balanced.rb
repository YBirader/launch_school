=begin
Q: Write a method that takes a string as an argument, and returns true if all the parentheses in the string are properly balanced, false otherwise.
   To be properly balanced, parentheses must occur in matching '(' and ')' pairs.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: Boolean
   
   PROBLEM DOMAIN:
   
   RULES:
   - return true if parentheses are matching; false otherwise
   - balanced pairs must start with '(' and end with ')'
   - balanced pair def: return true unless at any point, number of '(' > number of '(' && false if number of '(' != number of ')'
   - ignore all other chars


   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string, iterate through each char of the string. If the current char is equal to '(' or ')', then increment the relevant count.
   Return false if count for ')' > count fpr '('. After iteration, return false if no of '(' != no of ')'; otherwise return true.

2) EXAMPLES/TEST CASES
  Input: 'hell(0)'
  Output: true

   EDGE CASES:

3) DATA STRUCTURE
   string

4) ALGORITHM
   1. Iterate through string, counting parentheses
        - create a variable called right_count = 0
        - create a variable called left_count = 0
        - for each char in string
             return false if left_count > right_count
             increment right count if char == '('
             increment left count if char == ')'
       return false if right_count != left_count
       return true



5) CODE
=end

def balanced?(string)
  right_count = 0
  left_count = 0
  string.each_char do |char|
    return false if left_count > right_count
    right_count += 1 if char == '('
    left_count += 1 if char == ')'
  end
  right_count == left_count
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# method 2

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end
  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# further exploration

RIGHT_CHARS = ['(', '"', "'", "{"]
LEFT_CHARS = ['}', "}"]

def balanced?(string)
  right = 0
  left = 0
  string.each_char do |char|
    return false if left > right
    right += 1 if RIGHT_CHARS.include?(char)
    left += 1 if LEFT_CHARS.include?(char)
  end

  right == left
end

p balanced?("{hello}") == true
p balanced?("}hello{") == false
p balanced?('hel"lo') == false
p balanced?("he'llo") == false

