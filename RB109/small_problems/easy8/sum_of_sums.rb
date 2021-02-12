=begin
Q: Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may
   assume that the Array always contains at least one number.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array of integers
   OUTPUTS: sum of sums of each leading subsequence (integer)
   
   PROBLEM DOMAIN:
   - subsequence- a subsequence is a sequence that can be derived from another sequence i.e. array, by deleteing some or no elements
                  without changing the order of the remaining elements. 
   
   RULES:
   - array contains at least one integer
   - all elements of array are integers
   - subsequence def: subsequence defined by ref. index and run. index i.e. arr[i..i], i = 0, j = 0..length of aray - 1
     where i = ref. index and j = runner index
   - sum of subsequence def: subsequence1 + subsequence2 + .. subsequencen
   - no of subsequences is equal to the number of elements in the array

   CLARIFYING QUESTIONS:
   
   
   MENTAL MODEL: Given an array, find the subsequences of that array. Then, find the sum of each subsequence. Finally, add all of these
                 sums together.

2) EXAMPLES/TEST CASES
   Input: [1, 2, 3]  #=> [1], [1, 2], [1, 2, 3]
   Output: 10

   EDGE CASES:
   Input: [1]
   Output: 1

3) DATA STRUCTURE
   store each subsequence in an array


4) ALGORITHM
   1. find the subsequences of array
       - create an empty array called subsequences
       - create a variable called runner_index = 0
           while runner index <= length of array - 1
             append array[0 .. runnerr index] to subsequence
             increment runner index
   2. find the sum of each subsequence and add the sums together
       - create a variable called sum = 0
       - for each subsequence in subsequences
           add the sum of subsequence to sum
       - return sum
        

5) CODE
=end

def find_subsequences(array)
  subsequences = []
  runner_index = 0
  while runner_index <= array.size - 1
    subsequences << array[0..runner_index]
    runner_index += 1
  end
  subsequences
end

def sum_of_sums(array)
  sum = 0
  subsequences = find_subsequences(array)
  subsequences.each do |subsequence|
    sum += subsequence.inject(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# method 2

def sum_of_sums(array)
  sum = 0
  memo = 0

  array.each do |num|
    memo += num
    sum += memo
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# method 3

def sum_of_sums(array)
  array.map.with_index { |num, idx| array[0..idx].inject(:+) }.inject(:+)
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# method 4

def sum_of_sums(array)
  sum = 0
  sum += 0.upto(array.size) { |idx| array[0..idx].sum }
end