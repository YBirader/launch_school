=begin
Q: Write a method that takes an Array as an argument, and sorts that Array using the bubble sort alogorithm. Note that the Array should be sorted
   in place i.e. mutate the original Array. You may assume that the Array has at least two elements.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a sorted array
   
   PROBLEM DOMAIN:
   - bubble sort- sorting algorithm, where you make multiple iterations through the array. If element1 is greater than element2, the elements are swapped.
     The process is repeated until no swaps are made in a given iteration. The resulting Array is returned.
   
   RULES:
   - array contains at least two elements
   = swap condition def: swap if element1 > element2
   - array sorted condition def: for ith iteration, swap count == 0
   - element1 def: array[idx], where idx=0..array size -2, element2 def: array[idx+1]
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an array, iterate through the array until swap_counter == 0. On each iteration, compare elementi and elementj, where i != j, and 
   i, j are consecutive. If elementi > elementj, swap them and increment swap counter. Return sorted array

2) EXAMPLES/TEST CASES
   Input: [5, 3]
   Output: [3, 5]

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. iterate through the array until no swaps are made
        - repeat the below steps
        - create a variable called swap_counter = 0
        - iterate through the array
            - for each element in array
                if array[idx] > array[idx+1] where idx=(0..array size - 2)
                  swap array[idx] and array[idx+1]
                  increment swap counter
              break from loop if swap counter == 0
    2. return  array


5) CODE
=end

def bubble_sort!(array)
  n = array.size
  loop do
    swap_counter = 0
    0.upto(n - 2) do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swap_counter += 1
      end
    end
    n = n - 1  # optimization- tail element is already sorted
    break if swap_counter == 0
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)