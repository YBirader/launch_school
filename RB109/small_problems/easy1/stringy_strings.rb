=begin
Q: Write a method that takes one argument, a positive integer, and returns a string 
of alternating 1s and 0s, always starting with 1. The length of the string should match
the given integer.

1) UNDERSTAND THE PROBLEM
   
   INPUTS: a positive integer
   OUTPUTS: a string of length integer
   
   PROBLEM DOMAIN:
   
   RULES:
   1. length of string == int.to_s e.g. for n (odd), '1010...1', n (even), '101..0'
   2. Every even iteration, starting from 0 should output '1' and every odd iteration should output '0'.
   3. The number is greater than 0
   
   CLARIFYING QUESTIONS:
   1) Consider invalid input? No, ignore
   
   MENTAL MODEL: Given an psotive integer, output a string of alternating 1's and 0's, which always starts with one
   and has length int.to_s.

2) EXAMPLES/TEST CASES
   Input: 5
   Output: '10101'

   Input: 4
   Output: '1010'

   EDGE CASES:
   Input: 1
   Output: '1'

3) DATA STRUCTURE
   

4) ALGORITHM
0. initialise a counter variable = 0
1. Intialise an empty variable called string.
2. while counter < int
     append "1" if counter.even?
     append "0" if counter.odd?
     counter += 1
3. return string
     
5) CODE
=end

#method one 

def stringy(int)
  counter = 0
  string = ""
  while counter < int  # or use #times
    (counter.even?) ? string << "1" : string << "0"
    counter += 1
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

#method-two

def stringy_two(int)
  numbers = []

  int.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

#further-exploration

def stringy_three(int, start=1)
  string = ''

  int.times do |index|
    if start == 1
      index.even? ? string << '1' : string << '0'
    else
      index.even? ? string << '0' : string << '1'
    end
  end
  string
end

puts stringy_three(6, 1) == '101010'
puts stringy_three(9, 0) == '010101010'
puts stringy_three(4, 0) == '0101'
puts stringy_three(7, 1) == '1010101'

 