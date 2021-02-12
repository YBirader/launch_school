=begin
Q: Write a method that combines two arrays passed in as arguments, and returns a new array that contains all the elements from both
   Array arguments, with the elements taken in alternation. Assume that both the input Arrays are non-empty and that they have the same 
   number of elements.


1) UNDERSTAND THE PROBLEM
   INPUTS: two non-empty arrays
   OUTPUTS: an array (elements interleaved from 2 input arrays)
   PROBLEM DOMAIN:
   RULES:
   - 2 arrays must be interleaved together to form a new array
   - 2 input arrays have same number of elements i.e. n elements
   - new array will be [arr1[0], arr2[0], ... arr1[n], arr2[n]] where n is the length of the arrays
   - array elements can be any object
   CLARIFYING QUESTIONS:
   return a new object? yes
   MENTAL MODEL: Given two arrays, first append the first element from arr1 to a new array, then append the first element from arr2 to the new arr and 
                 so on until both arrays have been fully traversed.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3], [4, 5, 6]
   Output: [1, 4, 2, 5, 3, 5]

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. append elements at indicies 0 to n-1, where n is the length of the array
        - create a variable called index = 0
        - create an empty array called interleaved
        - while index < length of array1
            append element at index of arr1 and arr2 to interleaved
            increment index
    2. return interleaved

5) CODE
=end

def interleave(arr1, arr2)
  index = 0
 interleaved = []
 while index < arr1.size
  interleaved.push(arr1[index], arr2[index])
  index += 1
 end
 interleaved
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# further exploration

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']