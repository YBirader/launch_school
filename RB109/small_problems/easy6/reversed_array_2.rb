=begin
Q: Write a method that takes an Array and returns a new Array with the elements of the original list in reverse order. The original list should be modified.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a new reversed array
   PROBLEM DOMAIN:
   RULES:
   - a new array should be returned
   - reversal def: append arr[-n] where n = 1..length of arr to new array
   - return empty array if input is empty array
   CLARIFYING QUESTIONS:
   assume valid input? yes
   MENTAL MODEL: given an array, iterate through the array from the last element to the first element. Append each element to a new array and return.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3]
   Output: [3, 2, 1]

   Input: [1, 2, 3, 4, 5]
   Output: [5, 4, 3, 2, 1]

   EDGE CASES:
   Input: []
   Output: []

3) DATA STRUCTURE
   new array to store elements in reverse order

4) ALGORITHM
   1. create an empty array called reversed_array
   2. iterate through array and append each element to reversed_array
        - create counter variable called n = 1
        - while counter <= length of array
            append array[-n] to reversed_array
            increment n
    3. return reversed array

5) CODE
=end

def reverse(list)
  reversed_list = []
  n = 1
  while n <= list.size
    reversed_list << list[-n]
    n += 1
  end
  reversed_list
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true


# method 2

def reverse(list)
  reversed_list = []
  list.reverse_each { |el| reversed_list << el }
  reversed_list
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true


# further exploration

def reverse(list)
  list.each_with_object([]) do |el, reversed_arr|
    reversed_arr.unshift(el)
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

def reverse(list)
  list.inject([]) do |memo, el|
    memo.unshift(el)
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true