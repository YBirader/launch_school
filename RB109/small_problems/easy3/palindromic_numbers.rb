=begin
Q: Write a method that returns true if its integer argument is palindromic, false otherwise. a palindromic number reads the
   same forwards as it does backwards.

ALGORITHM
1. check if int is palindromic
    - split int into consituent digits into an array
    - return true if arr == arr.reverse

CODE
=end

#method 1

def palindromic_number?(int)
  digits = int.digits
  digits == digits.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(0110) == true

# method 2

def palindromic_number?(int)
  int == int.to_s.reverse.to_i
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(0110) == true