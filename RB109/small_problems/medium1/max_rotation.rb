=begin
Q: Write a method that takes an integer as an argument, and returns the maximum rotation of that argument. You do not have to handle multiple 0s.


1) UNDERSTAND THE PROBLEM
   INPUTS: an integer
   OUTPUTS: the maximum rotation of the input integer
   
   PROBLEM DOMAIN:
   - maximium rotation- the maximum rotation of an integer is, that for a given integer, iteratively rotate the last n digits of the integer,
     where n ranges from size of int to 1.

   RULES:
   - max rotate def: for n in (no of digits of int .. 1), rotate last n digits of iterative int.
   - do not have to handle multiple 0s i.e. ignore any leading 0s

   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer, find the number of digits of that integer. Then, iteratively rotate the last digits of int, where n = (size of int..1)
                 and return

2) EXAMPLES/TEST CASES
   Input: 35
   Output: 53

   EDGE CASES:

3) DATA STRUCTURE
   convert int to array of digits to count number of digits.

4) ALGORITHM
   1. find the number of digits in int
   2. iteratively rotate the last n digits, where n = (size of int..1)
        - create a variable called result = int
        - for n from int size downto 1
            result = rotate last n digits of result
   3. return result

5) CODE
=end

def rotate_array(arr)
  arr[1..-1] << arr.first
end

def rotate_rightmost_digits(int, n)
  string = int.to_s
  n = n % (string.size + 1)
  last_n_digits = string.slice!(-n..-1)
  rotated_last_n_digits = rotate_array(last_n_digits.chars).join
  string << rotated_last_n_digits
  string
end

def max_rotation(int)
  int_size = int.to_s.size
  result = int
  int_size.downto(1) do |n|
    result = rotate_rightmost_digits(result, n)
  end
  result.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10001) == 110

=begin
Q: Write a method that takes an integer as an argument, and returns the maximum rotation of that argument.

1) UNDERSTAND THE PROBLEM
   INPUTS: an integer
   OUTPUTS: the maximum rotation of the input integer
   
   PROBLEM DOMAIN:
   max. rotation- iteratively compute: for integer, rotate digits[-n..-1], where n = (size of int..2)
   
   RULES:
   - rotate array def: append array[0] to array[1..-1]
   - max rotation: for n from sizeofint downto 2, result = rotate digits[-n..-1]
   - do not need to handle multiple 0s
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer, split the integer into its constituent digits. iteratively rotate the specified subarray such that for n from
   sizeofint to 2, rotate array[-n..-1].

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end


def rotate_array(arr)
  arr[1..-1] <<  arr.first
end

def max_rotation(int)
  digits = int.to_s.chars
  result = digits
  size_of_int = digits.size

  size_of_int.downto(2) do |n|
    result[-n..-1] = rotate_array(digits[-n..-1])
  end
  result.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10001) == 110




