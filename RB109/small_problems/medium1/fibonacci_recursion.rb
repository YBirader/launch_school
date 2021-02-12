=begin
Q: Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.


1) UNDERSTAND THE PROBLEM
   INPUTS: n
   OUTPUTS: nth fibonacci number 
   
   PROBLEM DOMAIN:
   - fibonacci sequence- The fibonacci series is a sequence of numbers starting with 1 and 1, where each number is the sum of the two previous numbers.
   
   RULES:
   - fibonacci def: f(1) = 1, f(2) = 1, f(n) = f(n-1) + f(n-2), n > 2
   - terminal condition: if n <= 2 then return 1
   - assume n is always greater or equal to one
   
   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def fibonacci(n)
  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# tail recursion

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
