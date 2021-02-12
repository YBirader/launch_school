=begin
Q: Write a method that takes an integer as an argument, and returns the next featured number that is greater than the argument. 
   Return an error message if there is no next featured number


1) UNDERSTAND THE PROBLEM
   INPUTS: an integer
   OUTPUTS: the next featured number after integer
  
   PROBLEM DOMAIN:
   - featured number- an odd number that is a multiple of 7, an whose digit occur exactly once each.
   
   RULES:
   - featured number def: num featured if num is odd && num % 7 == 0 && num digits == num digits uniq
   - output must be featured number greater than num
   - no next featured number def: no featured numbers beyond 9876543210
   
   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given an integer, increment the integer until a featured number is found. If the incremented digit goes beyond 9876543210, then returns
   an error- otherwise return the featured number

2) EXAMPLES/TEST CASES
   Input: 12
   Output: 21

   EDGE CASES:

3) DATA STRUCTURE
   split number intto an array to check if it unique

4) ALGORITHM
   1. determine if a number is featured
       num is odd && num % 7 == 0 && unique digits of num == digits of num
    2. find the next featured number
          - current_number = num
          - increment current_number  until current_num is featured and return
          - stop incrementing if current_num is greater than 9876543210 and return error
         

5) CODE
=end

def is_featured?(num)
  digits = num.digits
  num.odd? && num % 7 == 0 && digits.uniq == digits
end

def featured(num)
  current_num = num
  loop do
    current_num += 1
    return current_num if is_featured?(current_num)
    break if current_num >= 9876543210
  end

  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# method 2
# uses properties of multiples of 7 and breaking up requirements for better optimisation

def featured(number)
  number += 1 # to avoid number being returned if number is itself a featured number
  number += 1 until number.odd? && number % 7 == 0

  loop do
    return number if number.digits.uniq == number.digits
    number += 14  # every other multiple of 7 is odd
    break if number >= 9876543210
  end

  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements