=begin
Q: Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares
   of the first n positive integers.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer, n
   OUTPUTS: square of sum to n - sum of squares to n
   
   PROBLEM DOMAIN:
   
   RULES:
   - square of sum def- (1+2+3..n)**2
   - sum of squares def- (1**2 + 2**2 + 3**2 + 4**2 +.. n**2)
   - sums are inclusive of n

   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer n, create a list of numbers from 1 to n inclusive. Find the sum of all these integers. Map the integers to the squared of each element
   and sum. Find the difference between the two and return

2) EXAMPLES/TEST CASES
   Input: 3
   Output: 22

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. Find the number 1..n inclusive
       - create an array with elements from 1 to n inclusive
   2. Find the square of the sum
       - sum all elements of the array
       - compute the square of the sum
   3. Find the sum of the squares
        - map the elements to their squares
        - sum the elements of the squared array
   4. Find the difference between the square of the sum - sum of the squares

5) CODE
=end

def sum_square_difference(n)
  numbers = (1..n).to_a
  square_of_sum = numbers.inject(:+) ** 2
  sum_of_squares = numbers.map { |num| num ** 2}.inject(:+)
  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150