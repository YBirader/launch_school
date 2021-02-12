=begin
Q: Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that
   contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments
   contain the same number of elements.


1) UNDERSTAND THE PROBLEM
   INPUTS: two arrays of integers
   OUTPUTS: an array
   PROBLEM DOMAIN:
   RULES:
   - each array contains integers
   - need to multiply pair of numbers at index i of arrays i.e. [arr1[0]*arr2[0], ... arr1[i]*arr2[i]...arr1[n]*arr2[n]], where i = 0..n, n is size of array
   - each input array contains same number of elements => if input arrays have size n, output should have size n.
   
   CLARIFYING QUESTIONS:
   - return a new object? yes
   MENTAL MODEL: Given two arrays of integers, until the arrays have been fully traversed, take elements at each index of the respective arrays and
                 multiply them together. Then, append each of these value to a new array and return.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3], [2, 3, 4]
   Output: [2, 6, 12]

   EDGE CASES:

3) DATA STRUCTURE
   store results in an array

4) ALGORITHM
   1. create a variable called index = 0
   2. create an empty array called result = []
   3. while index <= size of arr1 - 1
        append arr1[index] * arr2[index]
        increment index
   4. return result
        

5) CODE
=end

def multiply_list(arr1, arr2)
  index = 0
  result = []
  while index <= arr1.size - 1
    result << (arr1[index] * arr2[index])
    index += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |groups| groups.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
