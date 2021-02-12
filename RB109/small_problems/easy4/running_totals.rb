=begin
Q: Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
   and each element has the running total from the original Array.

1) UNDERSTAND THE PROBLEM
   INPUTS: array of integers
   OUTPUTS: array of integers
   PROBLEM DOMAIN:
   running total- A total that is continually adjusted to take account of further items.
   RULES:
   - a new array object should be returned
   - running total- each element of new array should be equal to an accumulator, where accumulator += array[i], starting from i == 0
   - returned array should have same number of elements
   - return an empty array if input array is empty
   CLARIFYING QUESTIONS:
   empty array input? return an empty array
   MENTAL MODEL: given an array of numbers, return a new array of numbers, where each element is equal to an accumulted total of the 
                 previous elements in the array.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3]
   Output: [1, 3, 6]

   EDGE CASES:
   Input: []
   Output: []


3) DATA STRUCTURE
   array to store accumulated values as elements.

4) ALGORITHM
   1. create a variable called accumulator = 0
   2. create an array called running_total = []
   3. for number in array
        accumulator = accumulatoor + array[index of number]
        append accumulator to running_total
   4. return running_total
5) CODE
=end

# method 1

def running_total(arr)
  running_total = []
  accumulator = 0
  arr.each_with_index do |num, idx|
    accumulator += arr[idx]
    running_total << accumulator
  end
  running_total
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# method 2

def running_total(arr)
  accumulator = 0
  arr.map { |num| accumulator += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# method 3

def running_total(arr)
  arr.inject([]) { |arr, num| arr << (arr.last.to_i + num) }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


def running_total(arr)
  arr.each_with_object([]) do |num, arr|
    arr << arr.last.to_i + num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

  