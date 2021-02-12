=begin
Q: Given an unordered array, and the information that exactly one value in the array occurs twice 
   (every other value in the array occurs exactly once), write a method that will find and return the duplicate value
   that is known to be in the array.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: the duplicate value in the array
   PROBLEM DOMAIN:
   - duplicate- an element of the array which occurs more than once
   RULES:
   - array is unordered
   - duplicate value occurs twice
   - duplicate: if array sorted, then value duplicated is next element is the same as current element
   CLARIFYING QUESTIONS:
   assume valid input? yes
   MENTAL MODEL: Given an array, order the array by integer value. Then iterate over the array. If the current element is the same
                 as the next element, return the current element.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3, 3]
   Output: 3

   EDGE CASES:

3) DATA STRUCTURE
   a sorted array

4) ALGORITHM
   1. sort the array by integer value
   2. find the duplicate value
        - create a empty variable called current_number
        - for each element in array
            return current_number if element equals current_number
            current_number = element


5) CODE
=end

def find_dup(arr)
  current_number = nil
  arr.sort.each do |num|
    return current_number if num == current_number
    current_number = num
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# method 2

def find_dup(arr)
  arr.each_with_object([]) do |el, check|
    check << el
    return el if check.count(el) == 2
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# method 3

def find_dup(arr)
  arr.find { |el| arr.count(el) == 2 }
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73