=begin
Q: Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays.
   There should be no duplication of values in the returned array, even if there are duplicates in the original Arrays.

1) UNDERSTAND THE PROBLEM
   INPUTS: two arrays
   OUTPUTS: an array where all elements are unique
   PROBLEM DOMAIN:
   RULES:
   - merge = arr1 concatenated with arr2
   - new array must have all unique elements
   
   CLARIFYING QUESTIONS:
   assume valid input? yes
   return a new object? yes
   MENTAL MODEL: Given two arrays, iterate through each array and append each element to a new array. Then, filter this new array so that
                 all the elements are unqiue and return.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3], [1]
   Output: [1, 2, 3]

   EDGE CASES:
   Input: [], [1]
   Output: [1]

3) DATA STRUCTURE
   store all the elements in an array

4) ALGORITHM
   1. concatenate arr1 with arr2 in a new variable called merged_arr
   2. filter merged_arr for unique entries
   3. return merged_arr

5) CODE
=end

# method 1

def merge(arr1, arr2)
  arr1.concat(arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# method 2

def merge(arr1, arr2)
   arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]