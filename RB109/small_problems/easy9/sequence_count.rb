=begin
Q: Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your
   method will create. The method should return an Array, that contains the same number of elements as the count argument, while the values of
   each element will be multiples of the starting number. Assume that the count argument is greater than 0, while the starting number can be 
   any integer value. If count is 0, an empty array should be returned.

1) UNDERSTAND THE PROBLEM
   INPUTS: count, starting number
   OUTPUTS: Array (with count elements and all elements multiples of starting number)
   
   PROBLEM DOMAIN:
   multiple- a multiple is a number, that when divided by another number has no remainder.
   
   RULES:
   - count > 0 for all starting numbers which can be positive or negative
   - array contains count elements
   - all array elements are multiples of starting_number: remainder num / starting_number == 0
   - array takes form: [starting_number, starting_number + starting_number, ..., starting_number * count]
   - array is inclusive of starting_number and final number.
   
   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given a starting number and an positive integer, generate integer multiples of starting_number and store these values in an array.

2) EXAMPLES/TEST CASES
   Input: 2, 3
   Output: [3, 6, 9]

   Input: 1, -1
   Output: [-1]

   EDGE CASES:
   Input: 0, 3
   Output: []

3) DATA STRUCTURE
   store multples in an array

4) ALGORITHM
   1. generate count number of starting_number of multiples
        - create an empty array called result = []
        - create a variable called current_multiple = starting_number
        - for count times
           append current_multiple to result
           current_multiple = current_multiple + starting_number

5) CODE
=end

def sequence(count, starting_number)
	current_multiple = starting_number
	count.times.with_object([]) do |_, result|
		result << current_multiple
		current_multiple += starting_number
	end
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# method 2

def sequence(count, starting_number)
   (1..count).map { |value| value * starting_number }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
