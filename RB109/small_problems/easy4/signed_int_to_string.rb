=begin
Q: Write a method that takes a positive or negative integer or zero, and converts it to a string representation.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer (positive or negative)
   OUTPUTS: string representation of integer
   PROBLEM DOMAIN:
   RULES:
   - DIGIT_TO_CHAR = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 
                       5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' } 
   - integer can be positive, negative or zero
   - def: even: int * -1 == odd => int is even, odd: int * -1 == even, int is odd
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given an integer, convert it to a string, where the polarity of the integer is reflected in the final string.

2) EXAMPLES/TEST CASES
   Input: 123
   Output: '123'

   Input: -21
   Output: '-21'

   Input: 0
   Output: '0'

   EDGE CASES:

3) DATA STRUCTURE
   store constituent digits of int in an array

4) ALGORITHM
   1. determine if int is positive or negative
      - create variable called polarity = int * -1
       if int * -1 is > 0
        convert polarity to a string
        prepend '-'
       else
        convert int to a string

5) CODE
=end

DIGITS = Array('0'..'9')

def integer_to_string(int)
  digits = int.digits.reverse
  chars = digits.map { |digit| DIGITS[digit] }
  chars.join
end

def signed_integer_to_string(int)
  if int > 0
    '+' + integer_to_string(int)
  elsif int < 0
    '-' + integer_to_string(int.abs)
  else 
    integer_to_string(int)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# method 2

def signed_integer_to_string(int)
  string = integer_to_string(int.abs)
  case int <=> 0
  when -1 then '-' + string
  when +1 then '+' + string
  else         string
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
