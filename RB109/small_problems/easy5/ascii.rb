=begin
Q: Write a method to determine the ASCII value of the string passed in as an argument.

1) UNDERSTAND THE PROBLEM
   INPUTS: string (in general will be multichar)
   OUTPUTS: integer (ASCII value of input string)
   PROBLEM DOMAIN:
   ASCII- character encoding standard for electronic communication. ASCII codes represent text in electronic devices.
   RULES:
   - ascii value of char == char.ord
   - ascii string value is the sum of the ASCII values of every char in the string.
   - return 0 if string is empty
   
   CLARIFYING QUESTIONS:
   assume valid input only? yes
   MENTAL MODEL: Given a string, return the sum of the ascii values of each char of the string.

2) EXAMPLES/TEST CASES
   Input: 'a'
   Output: 97

   Input: ''
   Output: 0

   EDGE CASES:

3) DATA STRUCTURE
   store sum of ascii values of each char in memo variable

4) ALGORITHM
   1. create a variable called ascii_count = 0
   2. for each char in string
        ascii_count += char.ord
   3. return ascii_count

5) CODE
=end

def ascii_value(string)
  string.chars.inject(0) { |memo, char| memo + char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0