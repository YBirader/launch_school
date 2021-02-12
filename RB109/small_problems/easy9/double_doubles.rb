=begin
Q: Write a method that returns 2 times the number provided as an argument, unless the argument is a double number. Double numbers
   should be returned as is.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer
   OUTPUTS: integer
   
   PROBLEM DOMAIN:
   - double number- a number with an even number of digits, whose left-side digits are exaclty the same as its right side digits e.g. 44, 1010 etc.
   
   RULES:
   - return num * 2 unless num is double number
   - double number def: number has even number of digits && digits[0.. digits size /2 -1] == digits[digits size / 2 .. digits size - 1]
   - double numbers should be left untouched

   CLARIFYING QUESTIONS:
   assume valid input? yes
   MENTAL MODEL: Given a number, return 2 * number unless it is a double number, in which case, return number.

2) EXAMPLES/TEST CASES
   Input: 7676
   Output: 7676

   Input: 123
   Output: 246

   EDGE CASES:

3) DATA STRUCTURE
   split the integer into its consttuent digits in an array

4) ALGORITHM
   1. check if number is double
       - split the number into its constituent digits in an array called digits
       - if digits is even
           - return true if digits[0.. digits size /2 -1] == digits[digits size / 2 .. digits size - 1]
else return false

   2. return num * 2 unless number is double number

5) CODE
=end

def is_double?(number)
  digits = number.digits
  digits.size.even? && digits[0..digits.size/2 - 1] == digits[digits.size/2..-1]
end

def twice(number)
  is_double?(number) ? number :  number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10