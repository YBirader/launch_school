=begin
Q: Write a method that searches for all multiples of 3 and 5, that lie between 1 and some other number, and then compute the 
   sum of those multiples e.g. if the supplied number is 20, the result should be 98 (3+5+6+9+10+12+15+18+20).
   Assume that the number passed in is an integer greater than 1.


1) UNDERSTAND THE PROBLEM
   INPUTS: target number
   OUTPUTS: sum of multiples of 3 and 5, from 1 to target_number
   PROBLEM DOMAIN:
   multiples- a number that can be divided by another number without a remainder
   RULES:
   - multiple- if num % factor == 0, then num is a multiple
   - target_number is an integer greater than 1
   - all multiples are natural numbers greater than one.
   - the target number is considered a multiple
   - multiples summed are unique i.e. not repeated
   
   CLARIFYING QUESTIONS:
   1. is there a limit to the target number? not
   2. assume valid input? yes
   MENTAL MODEL: Determine the list of multiples from 1 to the target_number of the factors, 3 and 5.
                Then, filter the list for unique values. Compute and return the sum of these unique multiples.

2) EXAMPLES/TEST CASES
   Input: 20
   Output: 98

   Input: 2
   Output: 0

   EDGE CASES:

3) DATA STRUCTURE
   store the mutliples in an array

4) ALGORITHM
   1. generate the multiples of 3 and 5 between 1 and the target_number
        - create an array called numbers, with numbers from 1 to target number inclusive
        - select all the numbers which are multiples of 3 and 5
   2. filter the array for unique values only
   3. sum and return the elements in the array

5) CODE
=end

def multisum(target_number)
  multiples = (1..target_number).select { |num| num % 3 == 0 || num % 5 == 0 }
  multiples.uniq.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168