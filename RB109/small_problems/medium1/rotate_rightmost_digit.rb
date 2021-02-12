=begin
Q: Write a method that can rotate the last n digits of a number.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer, last n digits to rotate
   OUTPUTS: integer, where last n digits are rotated
   
   PROBLEM DOMAIN:
   - rotation- rotation of an integer means where the first digit is moved to the end.
   
   RULES:
   - last n digits def: digits[-n..-1], remaining digits def: digits[0..n]
   - rotation def: append digits[0] to the end of digits[1..-1]
   - return a new integer
   - if n = 1, original digit is returned
   - n is always positive
   - n must be less than or equal to the size of the integer i.e. n = n % (size of integer + 1)
   
   CLARIFYING QUESTIONS:
   - what if n is greater than the size of the digit? Take this into acccount
   MENTAL MODEL: Given an integer, find the sub-integer which consists of the last n digits. Rotate this sub-integer. Then append these digits back
   to the original set of digits.

2) EXAMPLES/TEST CASES
   Input: 1234, 2
   Output: 1243

   Input: 1234, 1
   Output: 1234

   EDGE CASES:

3) DATA STRUCTURE
   convert integer to string for indexing control

4) ALGORITHM
   1. convert the integer into a string called string
   2. ensure n is valid
       - n = n % (string size + 1)
   3. slice the string to get the last n digits
        - create variable called last_n_digits = string[-n..-1]
        - string should be destructively sliced
   4. rotate last_n_digits
       - convert last_n_digits into array
       -  rotate array and join back into string
   5. append rotated last_n_digits to string
   6. convert string into integer and return

5) CODE
=end

def rotate_array(arr)
  arr[1..-1] << arr.first
end

def rotate_rightmost_digits(int, n)
  string = int.to_s
  n = n % (string.size + 1)
  last_n_digits = string.slice!(-n..-1)
  rotated_last_n_digits = rotate_array(last_n_digits.chars).join
  string << rotated_last_n_digits
  string.to_i
end

p rotate_rightmost_digits(1234, 2) == 1243
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# method 2

def rotate_array(arr)
  arr[1..-1] << arr.first
end

def rotate_rightmost_digits(int, n)
  digit_chars = int.to_s.chars
  digit_chars[-n..-1] = rotate_array(digit_chars[-n..-1]) # uses setter method []=, hence original digit_chars is modified.
  digit_chars.join.to_i
end

p rotate_rightmost_digits(1234, 2) == 1243
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

