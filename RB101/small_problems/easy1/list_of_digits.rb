=begin
Q: Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

1) UNDERSTAND THE PROBLEM
   INPUTS: positive integer
   OUTPUTS: array of consituent numbers of integer
   
   PROBLEM DOMAIN:

   RULES:
   1. A number conisting of one digit is still represented as a single element array.
   2. The number is a positive integer
   3. Repeated digits are considered their own element i.e. the final array contains non-unqiue elements.
  
   CLARIFYING QUESTIONS:
   1. No integer given? Assume valid integer given.
  
   MENTAL MODEL: For an integer consisting of one or more digits, split up the integer into its consituent digits
   as an array and return this array.

2) EXAMPLES/TEST CASES
   Input: 12345
   Output: [1, 2, 3, 4, 5]

   Input: 7
   Output: [7]

   EDGE CASES:
   Input: 4444
   Output: [4, 4, 4, 4]

3) DATA STRUCTURE
   Store the list of digits in an array.

4) ALGORITHM
   1. Convert the integer into a string
   2. split the string into an array called split_digits.
   3. for each digit in split_digits
        map into an integer
   4. return split_digits

5) CODE
=end

def digit_list(int)
  split_digits = int.to_s.split(//)
  split_digits.map { |digit| digit.to_i }
end

p digit_list(12345)

def another_digit_list(int)
  split_digits = []
  loop do
    int, remainder = int.divmod(10)
    split_digits.unshift(remainder)
    break if int == 0
  end
  split_digits
end

p another_digit_list(4444)

def another_another_digit_list(int)
  int.to_s.chars.map(&:to_i)
end

p another_another_digit_list(35268)

