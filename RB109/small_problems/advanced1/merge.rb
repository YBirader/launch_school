=begin
Q: Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments, in sorted order.
   The method should not mutate the original Array.

1) UNDERSTAND THE PROBLEM
   INPUTS: two sorted arrays
   OUTPUTS: sorted array, consisting of elements from the two input arrays
   
   PROBLEM DOMAIN:
   
   RULES:
   - method should keep output array sorted throughout
   - input arrays may be different sizes
   - append order def: if array1[i] <= array2[j], then append array1[i] to result, where i=(0...array1 size), j=(0...array2 size)
   - either array may be empty
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given two sorted arrays, iterate through each array using respective indices. If the current element of array1 is less than or equal to
   the current element of array2, then append element1, and increment its index. Otherwise, append element2 and incrment the other index. If either index1 or
   index2 is equal to its respective array size -1, stop appending any element from the corresponding array.

2) EXAMPLES/TEST CASES
   Input: [1, 5, 9], [2, 6, 8]
   Output: [1, 2, 5, 6, 8, 9]

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. create an empty array called result = []
   2. iterate through each array and append items in sorted order to result
        - create a variable called idx1 = 0
        - create a variable called idx2 = 0
        - LOOP:
           break if idx1 > array1 size -1 || idx2 > array2 size - 1
           - if array1[idx1] <= array2[idx2] && idx1 <= array1 size -1
               append array1[idx1] to result
               increement idx1
             elsif array2[idx2] <= array1[idx1] && idx2 <= array2 size -1
              append array2[idx2] to result
              increment idx2
             end
    3. return result            
           

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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# method 2

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |el1|
    while index2 < array2.size && el1 >= array2[index2]
      result << array2[index2]
      index2 += 1
    end
    result << el1
  end
  result.concat(array2[index2..-1])
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

