=begin
Q: Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values
   in the returned list should be those values that are in the 1st, 3rd, 5th and so on elements of the argument Array


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: array, where each even indexed element of input array is removed
   PROBLEM DOMAIN:
   RULES:
   - remove elements at array[i] if i.even?
   - return empty array if input array is empty
   CLARIFYING QUESTIONS:
   1. should we return the original array or a new object? new object should be returned
   MENTAL MODEL: given an array, remove all the elements at even indexes

2) EXAMPLES/TEST CASES
   Input: [0, 1, 2, 3]
   Output: [1, 3]


   EDGE CASES:
   Input: []
   Output: []

3) DATA STRUCTURE


4) ALGORITHM
   1. remove all the elements of Array at even indexes
        create empty array called odd_list
        for element in Array
          if element index is even, append element to odd_list
   2. return odd_list

5) CODE
=end

# method 1

def oddities(arr)
  odd_list = []
  arr.each_with_index do |element, index|
    odd_list << element if index.even?
  end
  odd_list


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# method 2


def oddities(arr)
  arr.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# further_exploration

def evenies(arr)
  arr.select.with_index { |_, idx| idx.odd? }
end