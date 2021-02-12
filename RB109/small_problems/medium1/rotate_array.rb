=begin
Q: Write a method that rotates an Array, by moving the first element to the end of the array. The original Array should not be modified.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a rotated array (first element to end of array)
   
   PROBLEM DOMAIN:
   RULES:
   - rotate array def: array[1..-1] with array[0] appended to end
   - return a new array object
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an array, save the first element of the array. Then, create a new array, which spans from the first to final index inclusive
   of the original array, and append the saved first element to the end. Then, return this array.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3, 4]
   Output: [2, 3, 4, 1]

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. save the first element of the array, array[0] in a variable called first_element
   2. append first element to array[1..-1]
   3. return this new array

5) CODE
=end

def rotate_array(arr)
  arr[1..-1] << arr.first
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# futher exploration

def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string('hello yusuf') == 'ello yusufh'

def rotate_int(number)
  rotate_array(number.to_s.chars).join.to_i
end

p rotate_int(1234) == 2341

