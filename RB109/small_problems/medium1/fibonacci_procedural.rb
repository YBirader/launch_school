=begin
Q: Write a procedural method which computes the nth fibonacci number.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer, n
   OUTPUTS: nth fibonacci number
   
   PROBLEM DOMAIN:
   - the fibonacci sequence is a sequence of numbers, where the first two numbers are 1 and the remaining numbers are the sum of the two previous
     numbers.
   
   RULES:
   - fibonacci def: first = 1, second = 1
                    if n > 2, for n -2 times, first = second, second = fibo
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def fibonacci(n)
  first_number = 1
  second_number = 1
  fibonacci_number = 0

  return first_number if n == 1
  return second_number if n == 2

  (n-2).times do 
    fibonacci_number = first_number + second_number
    first_number = second_number
    second_number = fibonacci_number
  end
  fibonacci_number
end

p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# method 2

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do |_|
    first, last = [last, first + last]
  end
  last
end

p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501