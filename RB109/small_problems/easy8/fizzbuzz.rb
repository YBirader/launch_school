=begin
Q: Write a method that takes two arguments; the first is the starting number, and the second is the ending number. Print out all
   numbers between the two numbers, except if a number is divisible by 3, print 'Fizz', if a number is divisible by 5, print 'buzz', and
   if a number is divisible by 3 and 5, print 'FizzBuzz'


1) UNDERSTAND THE PROBLEM
   INPUTS: starting number, ending number
   OUTPUTS: integers as string except if starting number is divisible by 3, 5 or both.
   
   PROBLEM DOMAIN:
   divisible- a number is divisible by another if the mod of the two numbers is 0.
   
   RULES:
   - starting and ending numbers are positive integers
   - num is divisible by i if num % i == 0
   - print 'Fizz' if num % 3 == 0 OR print 'Buzz' if num % 5 == 0, print 'FizzBuzz' if num % 3 && num % 5
   - print values as strings
   - output is inclusive of starting and ending number
   - output is one one line and comma delimited
   
   CLARIFYING QUESTIONS:
   - assume valid input? yes
   
   MENTAL MODEL: Given a starting number, find all natural numbers from the starting numbers upto and including the ending number. Go through
   the list of numbers. If a number is divisble by 3 and 5, transform it to 'FizzBuzz', if it is divisble by 3, transform it to 'Fizz', and if it
   is divisble by 5, transform it to 'Buzz'. Then print out the list.

2) EXAMPLES/TEST CASES
   Input: 1, 5
   Output: 1, 2, Fizz, 4, 'Buzz'

   EDGE CASES:

3) DATA STRUCTURE
   store numbers between starting and ending number inclusive in an array

4) ALGORITHM
   1. create an array with numbers from starting to ending number inclusive
   2. for number in numbers
        if number % 3 == 0 && number % 5 == 0
          map number to 'FizzBuzz'
        elsif number % 3 == 0
          map number to 'Fizz'
        elsif number % 5 == 0
          map number to 'Buzz'
    3. join list to string, where each element is delimited by ', '

5) CODE
=end

def fizzbuzz(starting_number, ending_number)
  numbers = Array(starting_number..ending_number)
  numbers.map! do |number|
    if number % 3 == 0 && number % 5 == 0
      'FizzBuzz'
    elsif number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    else
      number
    end
  end
  numbers.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
   result << if number % 3 == 0 && number % 5 == 0
               'FizzBuzz'
             elsif number % 3 == 0
              'Fizz'
             elsif number % 5 == 0
               'Buzz'
             else
               number
             end
  end
  result.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
