=begin
Q: Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins.
   The substrings that occur at each position should be returned in order, from shortest to longest.


1) UNDERSTAND THE PROBLEM
   
   INPUTS: a string
   OUTPUTS: an array of substrings
   
   PROBLEM DOMAIN:
   substring-  a continguous sequence of chars within the string
   
   RULES:
   - substring def: string[ref_index..runner_index], where ref = 0..length of string, runner_index  = 0..length of string
   - substrings ordered by position of first letter and then by shortest to largest
   - alternative def: leading substrings of string[i..n], where i = 0..n and n = length of the string
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string, find all the substrings of that string

2) EXAMPLES/TEST CASES
   Input:  'xyz'
   Output: ['x', 'xy', 'xyz', 'y', 'yz', 'z']
  
  
   EDGE CASES:
   Input: 'x'
   Output: ['x']

3) DATA STRUCTURE
   store the substrings in an array

4) ALGORITHM
   1. find the substrings of string
        - create an empty array called substrings = []
        - create a variable called ref_index = 0
        - while ref_index <= length of string
            create variable called runner_index = ref_index
            while runner_index <= length of strring
              append string[ref_index..runner_index] to substrings
              increment runner_index
            end
            increment ref_index
       - return substrings

    or

    1. find the substrings of string
        - create an empty array called substrings
        - for i=0 upto length of string
           find leading substrings of string[i..length of string]
           append elements of leading substrings to substrings


5) CODE
=end

def substrings(string)
  substrings = []
  ref_index = 0
  while ref_index <= string.size
    runner_index = ref_index
    while runner_index < string.size
      substrings << string[ref_index..runner_index]
      runner_index += 1
    end
    ref_index += 1
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# method 2

def leading_substrings(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string[0, count]
  end
  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.size) do |runner_index|
    substrings.push(*leading_substrings(string[runner_index..(string.size - 1)]))
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# method 3

def substrings(string)
  results = []
  (0...string.size).each do |ref_index|
    results.concat(leading_substrings(string[ref_index..-1]))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
