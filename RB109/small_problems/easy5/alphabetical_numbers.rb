=begin
Q: Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based
   on the English words for each number i.e. zero, one, two, three ...

1) UNDERSTAND THE PROBLEM
   INPUTS: array of integers between 0 and 19
   OUTPUTS: sorted array (based on english word for numbers)
   PROBLEM DOMAIN:
   RULES:
   - need to know english names of numbers: ['zero', 'one', 'two' ...]
   - sorting condition: name_of_int
   - sort from a to z
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a set of integers, find the english name of each integer. Then order these names alphabetically and convert
                 each name back to the respective integer and return.

2) EXAMPLES/TEST CASES
   Input: [0, 1, 2, 3....., 18, 19] #=> [zero, one, two, three ...]
   Output: [8, 18, 11]

   EDGE CASES:

3) DATA STRUCTURE
   store the english names of numbers in an array
   

4) ALGORITHM
   1. create an array of english names of numbers
   2. sort each number in terms of names[number]
   3. return sorted array

5) CODE
=end

NAMES = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
         'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
          'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NAMES[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# further exploration

def alphabetic_number_sort(numbers)
  numbers.sort do |num1, num2|
    NAMES[num1] <=> NAMES[num2]
  end
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

