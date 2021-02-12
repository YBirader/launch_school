=begin
Q: Write a method named include? that takes an Array and a search value as arguments. The method should return true if the search value
   is in the array, false if it is not.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array, a value
   OUTPUTS: Boolean (true if value is in array, false if not)
   
   PROBLEM DOMAIN:
   
   RULES:
   - takes single search value
   - array can cotain any object as elements
   - return true if array includes value
   
   CLARIFYING QUESTIONS:
   assume valid input? yes
   MENTAL MODEL: given an array, iterate through the array, until the current element equals the search value, at which point return true. Otherwise, return false.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3], 3
   Output: true

   Input: [nil], nil
   Output: true

   Input: [1, 2], 3
   Output: false

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. for each element in array
        return true if element == search_value
end
return false

5) CODE
=end

# method 1

def include?(arr, search_value)
  arr.each do |el|
    return true if search_value == el
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# method 2

def include?(arr, search_value)
  arr.count(search_value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false