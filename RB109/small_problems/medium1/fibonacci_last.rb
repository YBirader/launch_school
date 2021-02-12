=begin
Q: Write a method which returns the last digit of the nth Fibonacci sequence.


1) UNDERSTAND THE PROBLEM
   INPUTS: integer, n
   OUTPUTS: last digit of nth fibonacci number
   
   PROBLEM DOMAIN:
   - the fibonacci sequence is a sequence of numbers, where the first two numbers are 1 and the remaining numbers are the sum of the two previous
   numbers.
   
   RULES:
   - fibonacci def: f(1) = 1, f(2) = 2, f(n) = f(n-1) + f(n-2)
   - last digit def: last char of number as string or num % 10
   - last digit of nth fibonacci = last digit(n-1) + last_digit(n-2)
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer n, find the nth fibonacci number. Then, convert this number to a string, and retrieve the last character. return
   this last character as an integer.

   Given an integer n, find the last digit of the (n-1)th and (n-2)th numbers and add them together.

2) EXAMPLES/TEST CASES
   Input: 3
   Output: 2

   Input: 15
   Output: 0

   EDGE CASES:

3) DATA STRUCTURE
   convert nth fibonacci number to a string for indexing

4) ALGORITHM
   1. Find the last digit of the n-1th and n-2th fibonacci number and add them together
       - first = 1
       - second = 1
       - return n if n<= 2
       - for n-2 times
           - fibo = (first + second) % 10
           - first = last
           - last = fibo
        - return last

   

5) CODE
=end

# method 1

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do |_|
    first, last = [last, first + last]
  end
  last
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# method 2

def fibonacci_last(n)
  return n if n <= 2
  first = 1
  last = 1
  fibo = 0
  (n-2).times do
    fibo = (first + last) % 10
    first = last
    last = fibo
  end
  fibo
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# further exploration

LAST_DIGIT_CYCLE = 60

def fibonacci_last(n)
  return n if n <= 2
  n %= LAST_DIGIT_CYCLE
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, (first + last) % 10]
  end
  last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# NB: The last digit of the fibonacci numbers repeat after every 60 numbers. Thus, we only need to consider the last digit of the 
#     first 60 fibonacci numbers tto know the last digits of all remaining fibonacci numbers, vastly speeding up computation. The last 2,
#     last three digits etc have their own unique cycle periods.