=begin
Q: Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value
   should be arranged in order from the shortest to the longest substring.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: an array of leading substrings from shortest to longest
   
   PROBLEM DOMAIN:
   leading substring- a continguous sequence of chars within a string, where the first char is always the first char of the string.
   
   RULES:
   - leading substring def: string[0..runner_index], where runner_index = 0..length of the string
   - order output array in terms of length of substring
   - the number of leading substrings is equal to the length of the string
   - the full string is counted as a leading substring
   
   CLARIFYING QUESTIONS:
   assume valid input? yes
   
   MENTAL MODEL: Given a string, find all the leading substrings of that given string. Then, order the substrings as a function of length.

2) EXAMPLES/TEST CASES
   Input: 'xyz'
   Output: ['x', 'xy', 'xyz']

   EDGE CASES:
   Input: 'a'
   Output: ['a']

3) DATA STRUCTURE
   store substrings of string in an array

4) ALGORITHM
   1. find all the leading substrings of string
        - create a variable called runner_index = 0
        - create an empty array called substrings = []
        - while runner_index <= length of string - 1
            append string[0..runner_index] to substrings
            increment runner_index
   2. sort substrings as a function of length

5) CODE
=end

def leading_substrings(string)
  runner_index = 0
  substrings = []

  while runner_index <= string.length - 1
    substrings << string[0..runner_index]
    runner_index += 1
  end

  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# method 2

def leading_substrings(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string[0, count]
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']