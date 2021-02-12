=begin
Q: Write a method that converts a String of digits to an Integer


1) UNDERSTAND THE PROBLEM
   INPUTS: string of digits
   OUTPUTS: integer 
   PROBLEM DOMAIN: 
   RULES:
   - all chars of string are numeric
   - correct mappings: { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' = 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string of digits, convert the string of digits into integer type.

2) EXAMPLES/TEST CASES
   Input: '100'
   Output: 100

   Input: '7393'
   Output: 7393

   Input: '12'
   Output: 12

   EDGE CASES:

3) DATA STRUCTURE
   hash to store the corresponding integer value for a given numeric char

4) ALGORITHM
   1. Convert each numeric char into its integer form
        - create hsh = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' = 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
        - create array called digits to store int form of chars
        - for each char in string
           append hsh[char] to digits
   2. Reconstruct integer, with digits at correct place value
        - create variable called int = 0
        - for each digit in digits
            int = int * 10 + digit
   3. return int
           

5) CODE
=end

CHAR_TO_DIGIT = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
                  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
   digits = []
   string.each_char { |char| digits << CHAR_TO_DIGIT[char] }
   int = 0
   digits.each { |digit| int = int * 10 + digit }
   int
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# further work

CHAR_TO_HEX = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
                '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14,
                'f' => 15 }

def hexadecimal_to_integer(hex)
   digits = hex.chars.map { |char| CHAR_TO_HEX[char.downcase] }
   int = 0
   digits.each { |digit| int = int * 16 + digit }
   int
end

p hexadecimal_to_integer('A1') == 161
p hexadecimal_to_integer('4D9F') == 19871