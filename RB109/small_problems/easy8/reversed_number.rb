=begin
Q: Write a method that takes a positive integer as an argument, and returns that number with its digits reversed.

1) UNDERSTAND THE PROBLEM
   INPUTS: positive integer
   OUTPUTS: integer (where input int digits have been reversed)
   
   PROBLEM DOMAIN:
   RULES:
   - if reversed int contains leading zeros, ignore them
   - digits of int: num % 10 / 10 until num == 0 will give digits of int at each iteration
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an positive integer, split the integer into its constituent digits. Reverse this list. Then remove any leading 
   zeros and return the integer.

2) EXAMPLES/TEST CASES
   Input: 12000
   Ouput: 21

   Input: 1
   Output: 1

   EDGE CASES:

3) DATA STRUCTURE
   split the integer into its constituent digits in an array

4) ALGORITHM
   1. split the integer into its constituent digits
        - create an empty array called digits = []
        - while num != 0
            append num % 10 to digits
            num = num / 10
    2. reverse the digits array
         - create a variable called index = 0
         - until index == size of array / 2 - 1
           - swap elements at index i and index -i-1
    3. remove any leading zeros
         - remove elements from reversed_digits in turn from index 0 until current_num != 0

5) CODE
=end

def get_digits(number)
  digits = []
  while number != 0
    number, digit = number.divmod(10)
    digits << digit
  end
  digits
end

def reversed_number(number)
  reversed_digits = get_digits(number)
  reversed_digits.map(&:to_s).join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1


# method 2

def reversed_number(number)
  number.digits.map(&:to_s).join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1


# better_way
=begin
Data Structure
represent number as a string

Alogorithm
1. Convert the number to a string
2. reverse the string
3. convert the string to a number
=end

def reversed_number(number)
  number.to_s.reverse.to_i
end

# NB: in this case, representing an int as a string is much more efficient.



    



