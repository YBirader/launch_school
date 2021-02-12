=begin
Q: Write a method that takes an Array as an argument, and returns two arrays (as a pair of nested arrays) that contain the first half
   and second half of the orignal array, respectively. If the original array contains an odd number of elements, the middle element should be placed
   inside the first element.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a 2d nested array
   
   PROBLEM DOMAIN:
   
   RULES:
   - nested array: first element: array of first half of input, second element: array of second half of input arr
   - if arr length is odd, then middle element should be in first half
   - if array length is even: first_half = arr[0, array length / 2], second_half = arr[array length / 2, array length / 2]
   - if array length is odd: first_half = arr[0, array length /2 + 1], second_half = arr[array length/2 + 1, array length /2 ]
   - return 2d array with empty array elements if input arr is empty
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an array, slice the array in two halves; in the case of an odd array, the middle element is in the first half.
                 Then, append the two halves to another array and return that array.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3]
   Output: [[1, 2], [3]]

   Input: [1, 2, 3, 4]
   Output: [[1, 2], [3, 4]]

   EDGE CASES:
   Input: []
   Output: [[], []]

3) DATA STRUCTURE
   

4) ALGORITHM
   1. create an array called halves = []
   2. slice the array into two halves
       - if arr length is even
           first_half = arr[0, array length / 2], second half = arr[array length / 2, array length / 2]
       - else first_half = arr[0, array length / 2 + 1], second_half = arr[arrray length / 2 + 1, array length / 2]
    3. append first_half and second_half to halves to create a nested array
    4. return halves

5) CODE
=end

def halvsies(arr)
  first_half, second_half = if arr.size.even?
                              [arr[0, arr.size/2], arr[arr.size/2, arr.size/2]]
                            else
                              [arr[0, (arr.size/2)+1], arr[(arr.size/2)+1, arr.size/2]]
                            end

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# method 2- find middle first

def halvsies(arr)
  middle = (arr.size/2.0).ceil
  first_half = arr[0, middle]
  second_half = arr[middle, arr.size - middle]

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]



