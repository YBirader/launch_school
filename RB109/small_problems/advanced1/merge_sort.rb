=begin
Q: Write a method that takes an Array as an argument and sorts it using the merge sort algorithm. Assume that the array contains only one type of data, where
   that data is all numbers or all strings.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a sorted array
   
   PROBLEM DOMAIN:
   - merge sort- recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested
     sub-arrays in sorted order,
   
   RULES:
   - merge sort is a recursive algorithm
   - break array into sub-arrays, where each sub-array has one element
   - base condition- nested array size == 1
   - sorted condition def: sorted array size == original array size
   - merge nested arrays in sorted order
   - sub-instances: split array in half and give one half to each friend- first_half = array[0...array.size/2], second_half = array[array.size/2..-1]
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an array, split the array into nested sub-arrays until the nested array size == 1. Then, sort each nested array by merging them
   together in sorted order until array size == original array size. Then, return this array.

2) EXAMPLES/TEST CASES
   Input: [9, 5, 7, 1] #=> [[9, 5], [7, 1]] => [[[9], [5], [7], [1]]]
   Output: [1, 5, 7, 9]

   EDGE CASES:

3) DATA STRUCTURE
   an array

4) ALGORITHM
   1. slice the array into unit sized nested sub-arrays (recursively)
        - if nested sub-array size == 1, then return 

5) CODE
=end

def merge(array1, array2)
   result = []
   idx1 = 0
   idx2 = 0
   loop do 
     break if idx1 > array1.size-1 && idx2 > array2.size-1
     if array1[idx1] && array2[idx2] && array1[idx1] <= array2[idx2]
       result << array1[idx1]
       idx1 += 1
     elsif array1[idx1] && array2[idx2] && array2[idx2] <= array1[idx1]
       result << array2[idx2]
       idx2 += 1
     elsif array1[idx1]
       result << array1[idx1]
       idx1 += 1
     else
       result << array2[idx2]
       idx2 += 1
     end
   end
   result
 end

 def merge_sort(array)
   if array.size < 2
      return array
   else
      first_half = array[0...array.size/2]
      first_half_sorted = merge_sort(first_half)
      second_half = array[array.size/2..-1]
      second_half_sorted = merge_sort(second_half)
   end
   merge(first_half_sorted, second_half_sorted)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
