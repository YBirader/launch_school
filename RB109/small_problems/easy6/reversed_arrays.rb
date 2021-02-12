=begin
Q: Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into
   this method. The return value should be the same Array object.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a reversed array
   PROBLEM DOMAIN:
   RULES:
   - should mutate the original Array object
   - reversal of elements def: swap arr[n] with arr[-n-1] where n = 0..length of arr / 2
   - elements of array can be any data type
   - return empty array for empty array input
   CLARIFYING QUESTIONS:
   - assume valid input? yes
   MENTAL MODEL: Given an array of elements, reverse the elements such that the element at the first index is moved to the last index, 
                 the second element is moved to the second last index and so on. Then return the reversed array.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3, 4]    [2, 3, 4, 1]
   Output: [4, 3, 2, 1]

   Input: [4, 2, 9]
   Output: [9, 2, 4]

   EDGE CASES:
   Input: []
   Output: []

3) DATA STRUCTURE
   reverse the given array via swapping elements

4) ALGORITHM
   1. swap elements across the arrays axis
        - create a variable called left_index = 0
        - while left_index <= length of arr / 2
           - swap elements, arr[left_index] and arr[-left_index-1]
           - increement left_index
    2. return the array

5) CODE
=end

# reversal def: [1, 2, 3] => [3, 2, 1]  3 / 2


def reverse!(list)
  list2 = list.clone
  list.length.times { |m| list[m] = list2[-m-1] }
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true


def reverse!(list)
  left_index = 0
  while left_index < list.size / 2
    list[left_index], list[-left_index-1] = list[-left_index-1], list[left_index]
    left_index += 1
  end
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
