=begin
: Write a method that takes a grocery list (array) of fruits, with quantities, and converts it into an array of the correct number 
   of each fruit.


1) UNDERSTAND THE PROBLEM
   INPUTS: nested array [[fruit, no of fruit]]
   OUTPUTS: array (of strings)
   
   PROBLEM DOMAIN:
   RULES:
   - nested array has fruit and no of fruit
   - no of elements in final array: append sub_array[0] to output array array[1] times
   - each fruit should be duplicated no of fruit times
   
   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: given a nested array of fruit and the no of that fruit, add that number of the fruit to an array and return

2) EXAMPLES/TEST CASES
   Input: [['banana', 2]]
   Output: ['banana', 'banana']

   EDGE CASES:

3) DATA STRUCTURE
   store fruit in an array

4) ALGORITHM
   1. append no of fruit of fruit to an array
        - create an array called result
        - for grocery in grocery_list
            append grocery[0] to result grocery[1] times
   2. return result

5) CODE
=end

def buy_fruit(grocery_list)
  grocery_list.each_with_object([]) do |(fruit, quantity), result|
    quantity.times { |_| result << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(grocery_list)
  grocery_list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]