=begin
Q: Write a program that asks the user to enter an integer greater than 0, then it asks if the user wants to determine the sum
   or product of all numbers between 1 and the entered integer.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer greater than 0, sum or product
   OUTPUTS: sum or product of integers from 1 to n
   PROBLEM DOMAIN:
   
   RULES:
   1. sum of integers = n + (n - 1) + (n - 2) + .. 1
   2. product of integers = n * (n - 1) * (n - 2) * .. 1 i.e. factorial
   3. sum/product is inclusive of 1 and n
   
   CLARIFYING QUESTIONS:
   Assume valid input? yes
   MENTAL MODEL: Given a number n, determine the sum or product of all the integers from 1 to n,
                 depending on what the user specifies.

2) EXAMPLES/TEST CASES
   Input: 5, 's'
   Output: 15

   Input: 6, 'p'
   Output: 720

   EDGE CASES:
   Input: 1, 's'
   Output: 1

   Input: 1, 'p'
   Output: 1

3) DATA STRUCTURE

4) ALGORITHM
   0. Compute the sum of numbers from 1 to n
        save n in local variable called current_number
        let sum = 0
        while current_number is greater than 0
            sum +=  current_number
          decerment current_number
   1. return product
   2. Compute the product of numbers from 1 to n
        save n in local variable called current_number
        let product = 1
        while current_number > 0
          product *= current_number
          decrement current number
   3. return product
5) CODE
=end

def sum(number)
  current_number = number
  sum = 0
  while current_number > 0
    sum += current_number
    current_number -= 1
  end
  sum
end

def product(number)
  current_number = number
  product = 1
  while current_number > 0
    product *= current_number
    current_number -= 1
  end
  product
end

def retrieve_number
  puts ">> Please enter an integer greater than 0:"
  gets.chomp.to_i
end

def retrieve_operation
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  gets.chomp
end

number = retrieve_number()
operation = retrieve_operation()
if operation == 's'
  puts "The sum of the integers between 1 and #{number} is #{sum(number)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{number} is #{product(number)}."
else 
  puts 'Error'
end

# second-method

def recursive_sum(number)
  if number == 0
    number
  else
    recursive_sum(number - 1) + number
  end
end

def recursive_product(number)
  if number == 1
    number
  else 
    recursive_product(number - 1) * number
  end
end

if operation == 's'
  puts "The sum of the integers between 1 and #{number} is #{recursive_sum(number)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{number} is #{recursive_product(number)}."
else 
  puts 'Error'
end

# third-method

def compute_sum(number)
  numbers = (1..number).to_a
  numbers.inject(:+)
end

def compute_product(number)
  numbers = (1..number).to_a
  numbers.inject(:*)
end

if operation == 's'
  puts "The sum of the integers between 1 and #{number} is #{compute_sum(number)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{number} is #{compute_product(number)}."
else 
  puts 'Error'
end

