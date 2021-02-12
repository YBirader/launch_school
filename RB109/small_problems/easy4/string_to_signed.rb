=begin
Q: Write a method that converts a String of digits to an Integer. The String may have a leading + or - sign-
   If the first character is a =, then the method should return a positive number; if it is a -, then it should return
   a negative number. If no sign is given, a positive number should be returned. Assume the string will always contain a
   valid number.


1) UNDERSTAND THE PROBLEM
   INPUTS: string of digits which may be signed.
   OUTPUTS: integer (with appropriate sign)
   PROBLEM DOMAIN: 
   RULES:
   - all chars of string are numeric
   - correct mappings: { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' = 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
   - sign = first_char => if sign == + or sign is empty, do nothing. if sign == -1, times final int by minus 1
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string of digits, convert the string of digits into integer type, where the final integer
                 should have the correct polarity.

2) EXAMPLES/TEST CASES
   Input: '100'
   Output: 100

   Input: '-7393'
   Output: -7393

   Input: '12'
   Output: 12

   EDGE CASES:

3) DATA STRUCTURE
   hash to store the corresponding integer value for a given numeric char
   array to convert each char into int format

4) ALGORITHM
   1. determine sign of string
       - if first char == +
           convert the string to integer
   elseif first_char == -
     convert the string to negative integer
   else convert string to integer

           
           

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

def string_to_signed_integer(string)
  string_remainder = string[1..-1]
  int_remainder = string_to_integer(string[1..-1])
  case string[0]
  when '-' then -int_remainder
  when '+' then int_remainder
  else
    string_to_integer(string)
  end
end
  

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100