=begin
Q: Write a method that calculates and returns the index of the first Fibonacci number that has the 
   the number of digits specified as an argument, defined such that the first fibonacci number has index 1.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer 
   OUTPUTS: integer (index of first fibonacci no with number of digits equal to input)
   PROBLEM DOMAIN:
   - fibonacci sequence- a recursive sequence, such that the first two numbers are one and subsequent numbers are the sum of the 
     previous two numbers.
   RULES:
   - index of first number is 1
   - must return index of the first number with digits equal to input
   - fibonacci: f(1) = 1, f(2) = 1, f(n) = f(n-1) + f(n-2) where n is index
   - no of digits: n.digits.count
   - assume argument is always greater or equal to 2.
   CLARIFYING QUESTIONS:
   assume valid input? yes.
   MENTAL MODEL: given an integer, generate the fibonacci numbers until the point when input == no of digits of current_number. Then,
                 return the index of that number.

2) EXAMPLES/TEST CASES
   Input: 2  # 1, 1, 2, 3, 5, 8, 13
   Output: 7

   Input: 3
   Output: 12

   EDGE CASES:

3) DATA STRUCTURE
   store fibonacci numbers in an array to keep track of index
   count digits by splitting int into an array and counting the number of elements

4) ALGORITHM
   1. generate the fibonacci numbers until the point where input == no of digits of current_number
        - create a variable called first_number = 1
        - create a variable called second_number = 1
        - create an array called fibonacci_numbers = [1, 1]
        - until no of digits of current_number >= number_of_digits
            -current_number = first_number + second_number
            - append current_number to fibonacci_numbers
            - set first_number = second_number
            - set second_number = current_number
    2. return the index of the last number 
         - return the length of fibonacci_numbers
            
5) CODE
=end

def find_fibonacci_index_by_length(number_of_digits)
  first_number = 1
  second_number = 1
  current_number = 1
  fibonacci_numbers = [1, 1]

  until current_number.to_s.length >= number_of_digits
    current_number = first_number + second_number
    fibonacci_numbers << current_number
    first_number = second_number
    second_number = current_number
  end

  fibonacci_numbers.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# method 2

def find_fibonacci_index_by_length(number_of_digits)
  first_number = 1
  second_number = 1
  current_number = 0
  index = 2

  loop do
    break if current_number.to_s.length >= number_of_digits
    current_number = first_number + second_number
    index += 1

    first_number = second_number
    second_number = current_number
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
    