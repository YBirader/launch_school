=begin
Q: Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). 
Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors. 
For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. 
The sum of these multiples is 78. If no factors are given, use 3 and 5 as the default factors.


1) UNDERSTAND THE PROBLEM
   INPUTS:
   the target number 
   the factors
   OUTPUTS:
   sum of multiples 
   
   PROBLEM DOMAIN:
   multiples- a number that can be divided by another number without a remainder.
   
   RULES:
   i) The multiples summed must be unique e.g. 15 is a multiple of 3 and 5 but is only summed once.
   ii) The target number is the limit but is not considered a multiple itself.
   iii) All numbers are natural numbers including 1.
   
   CLARIFYING QUESTIONS:
   i) What are the possible values of the target number? Are negative numbers allowed? Empty?
      Any natural number greater than 0. There will always be a target number provided.
   ii) How will the factors be provided? The factors will be provided as an array.
   iii) What happens if only 3 or 5 is given as a factor? Should the program default to [3, 5]?
        The  program should only default if no factors are given.
   
   MENTAL MODEL: Determine a list of all the multiples of a set of factors up to a target value. Then filter the list of
                 multiples to the unique values. Then,  compute and return the sum of the unique multiples.

2) EXAMPLES/TEST CASES
  i) Input: Target number: 20 ; Factors: [3, 5]
     Output: 78
  ii) Input: Target number:  20 ; Factors: [3]
      Output: 63
  iii) Input: Target number: 20 ; Factors: [5]
       Output: 30
  iv) Input: Target number: 20 ; Factors: []   
      OutputL 78
   
  EDGE CASES:
  i) Input:  Target number:  20 ; Factors: [19] # boundary of range
     Output: 19

3) DATA STRUCTURE
   Store the list of multiples of the factors in an Array

4) ALGORITHM
   1. Create an empty array called multiples, that will contain the factors
   2. If factors is empty, then set factors to [3, 5]
   3. for factor in factors
        set current_multiple = factor to keep track of multiples of factor
        while current_multiple < target
          append current_multiple to multiples
          add factor to current_multiple
   4. Remove all duplicates from multiples
   5. Compute and return the sum of all numbers in multiples

5) CODE
=end

def sum_of_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?
  factors.each do |factor|
    current_multiple = factor
    
    while current_multiple < target
      multiples.push(current_multiple)
      current_multiple += factor
    end
  end

  multiples.uniq.inject(0, :+)
end

sum_of_multiples(20, [3, 5])
sum_of_multiples(20, [3])
sum_of_multiples(20, [5])
sum_of_multiples(20, [])
sum_of_multiples(1, [])
sum_of_multiples(20, [19])
