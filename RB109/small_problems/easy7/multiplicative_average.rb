=begin
: Write a method that takes an Array of Integers as input, multiplies all the numbers together and divides the result 
   by the number of entries, and then prints the result, rounded to 3 decimal places. Assume the array is non-empty.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array of integers
   OUTPUTS: the multiplicative average of the array integers (to 3 dp) as a string
   
   PROBLEM DOMAIN:
   RULES:
   - m average = arr[0] * arr[1] ... arr[n] / size of array
   - result given to 3dp, where ther must be 3 0 rightt padding
   - array is non-empty and all the elements are integers
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given an array, multiply all the integers in the array together and divide by the size of the array. Then, format the
                 result such that the resulting float has a 3dp precision.

2) EXAMPLES/TEST CASES
   Input: [6]
   Output: 6.000

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. multiply all the integers in the array together
       - create a variable called memo = 1
       - for each integer in array
           memo = memo * integer
       - return memo
    2. compute the size of the array
    3. divide memo by array size
    4. format result so that it is given to a precision of 3 dp
    5. print result

5) CODE
=end

def show_multiplicative_average(array)
  memo = 1
  array.each { |int| memo *= int }
  result = memo.to_f / array.size
  puts format("The result is %.3f", result.to_s)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# method 2

def show_multiplicative_average(array)
  result = array.inject(:*).to_f / array.size
  puts format("The result is %.3f", result.to_s)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667