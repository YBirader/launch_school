=begin
Q: Write a method that takes a positive integer or zero, and converts it to a string representation.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer
   OUTPUTS: string representation of integer
   PROBLEM DOMAIN:
   RULES:
   - DIGIT_TO_CHAR = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 
                       5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' } 
   - integer will be positive ot zero only
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given an integer, find its string representation

2) EXAMPLES/TEST CASES
   Input: 123
   Output: '123'

   Input: 21
   Output: '21'

   Input: 0
   Output: '0'

   EDGE CASES:

3) DATA STRUCTURE
   store constituent digits of int in an array

4) ALGORITHM
   1. Convert each digit of int into string representation
        - split int into constituent digits and save in an array called digits
        - map digits to DIGIT_TO_CHAR(digits)
   2. join chars together to form string
   3. return joined string

5) CODE
=end

DIGITS = Array('0'..'9')

def integer_to_string(int)
  digits = int.digits.reverse
  chars = digits.map { |digit| DIGITS[digit] }
  chars.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# method 2

def integer_to_string(int)
  string = ''
  loop do
    int, remainder = int.divmod(10)
    string.prepend(DIGITS[remainder])
    break if int == 0
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
