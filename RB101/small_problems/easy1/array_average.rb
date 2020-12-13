=begin
Q: Write a method that takes one argument, an array containing integers and returns the average of all numbers in the array. 
   The array will never be empty and the numbers will always be positive integers. Your result should also be a positive integer.

1) UNDERSTAND THE PROBLEM
   INPUTS: array of positive integers
   OUTPUTS: the average of the array elements 
   
   PROBLEM DOMAIN:
   average = sum of all elements / number of elements
   
   RULES:
   1. Array will never be empty
   2. Array will always contain positive integers
   3. mean = sum of array elements / number of elements
   4. repeat elements are still included in the sum
   5. Result should be an integer, not float. If float, should be rounded down to nearest integer.
   
   CLARIFYING QUESTIONS:

   MENTAL MODEL: return the sum of all the array elemets divided by the number of array elements.

2) EXAMPLES/TEST CASES
   Input: [1, 6]
   Output: 3

   Input: [1, 5, 87, 45, 8, 8]
   Output: 25

   EDGE CASES:
   Input: [1]
   Output: 1

3) DATA STRUCTURE
   maintain numbers in array, as given in raw input.

4) ALGORITHM
   0. reduce the array to a sum of all the elements
   1. find the length of array
   2. return sum of array / length of array

5) CODE
=end

def average(array)
  sum = array.inject(:+)
  sum / array.count
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

#further-exploration

def average_float(array)
  sum = array.inject(:+).to_f
  sum / array.count
end

puts average_float([1, 6])
  

