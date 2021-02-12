=begin
Q: Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that
   contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted
   by increasing value. You may assume that neither argument is an empty Array.


1) UNDERSTAND THE PROBLEM
   INPUTS: two arrays of integers
   OUTPUTS: an array (product of two matrices)
   
   PROBLEM DOMAIN:
   RULES:
   - all elements of arrays are integers
   - product of every element permutation: arr[i] * arr[j] where i = 0..n, j=0..m, where n = size of arr1, m = size of arr2
   - final aray should be sorted by increasing value
   - both arrays have finite size, but generally have different sizes.
   
   CLARIFYING QUESTIONS: 
   return a new object? yes
   MENTAL MODEL: Given two arrays of integers, multiply each element in arr1 by each element in arr2 and store the products in an array. Then, sort the 
                 products by increasing numeric value.

2) EXAMPLES/TEST CASES
   Input: [1, 2], [1, 3]
   Output: [1, 2, 3, 6]

   EDGE CASES:

3) DATA STRUCTURE
   store products in an array

4) ALGORITHM
   1. find the products of all elemental combinations
        - create an empty array called products = []
        - for each el1 in arr1
            for each el2 in arr2
              append el1 * el2 to products
            end
          end
    2. sort products by increasing numeric value



5) CODE
=end

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |el1|
    arr2.each do |el2|
      products << el1 * el2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
