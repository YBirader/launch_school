=begin
Q: Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing 
   one integer, the second row containing two integers, the third row containing three integers, and so on. Given an integer representing
   the number of a particular row, return at integer representing the sum of all integers in that row. 

1) UNDERSTAND THE PROBLEM
   
   INPUTS: row index
   
   OUTPUTS: the sum of all integers in row index
  
   PROBLEM DOMAIN:
   row- a row corresponds to a list of numbers, grouped horizontally, each with an index, where the first row has index 1 until index n.
   
   RULES:
   1. the first row begins with 2
   2. each row has n elements i.e. length n, where n is the row index
   3. all elements in a given row are even, consecutive, integers
   4. the required rows need to be generated 
  
   sequence: 2, 4, 6, 8, 10 ...
    row 1 [2]
    row 2 [4, 6]
    row 3 [8, 10, 12]
    .
    .
    row n []

   CLARIFYING QUESTIONS:
   1. Assume valid input? yes
   2. What is the row number of the first row? 1

   MENTAL MODEL: Given a row number n, generate n rows, with row numbers starting from 1 to n, where each row contains row_number consecutive, even, integers.
                 For the nth row, sum and return all the integers.

2) EXAMPLES/TEST CASES
   Input: 3
   Outpur: 30

   Input: 1
   Output: 2

   Input: 2
   Output: 10

   Input: 4
   Output: 68

   EDGE CASES:
   Input: 0
   Output: 0

3) DATA STRUCTURE
   2d array- each element is a row, thus represents a 2d matrix.
   array- each row is an array of consecutive, even, integers, where the first row starts at 2

4) ALGORITHM
   0. initalise a local variable called current_row_number = 1
   1. initalise an empty array called matrix
   2. generate n rows, where each row has current_row_number elements
        - initalise a local variable called counter = 2
        - while current_row_number <= n
            current_row = []
            until size_of_current_row == current_row_number
              append counter to current_row
              increment counter by 2
          append current_row to matrix
          increment current_row_number by 1
   2. let nth row = nth element of matrix
   3. sum and return the nth row 

5) CODE
=end

def sum_of_row(n)
  return n if n == 0
  current_row_number = 1
  matrix = []
  counter = 2
  while current_row_number <= n 
    current_row = []
    until current_row.length == current_row_number
      current_row.push(counter)
      counter += 2
    end
    matrix.push(current_row)
    current_row_number += 1
  end
  nth_row = matrix.last
  nth_row.inject(:+)
end

puts sum_of_row(0)
puts sum_of_row(1)
puts sum_of_row(2)
puts sum_of_row(3)
puts sum_of_row(4)



