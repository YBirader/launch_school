=begin
Q: Build a program that displays when the user will retire and how many years they have to work till retirement

1) UNDERSTAND THE PROBLEM
   INPUTS: current age, age of retirement
   OUTPUTS: current year, retirement year, years left till retirement
   
   PROBLEM DOMAIN:
   
   RULES:
   0. years left till retirement = age of retirement - current age
   1. retirement year = current year + years left till retirement
   
   CLARIFYING QUESTIONS:
   1. Assume valid input? yes
   2. What if user inputs retirement age < current age? assume this never occurs
   
   MENTAL MODEL: Given the age of the user and their predicted retirement age, determine
                 the year of retirement and years left until retirement.

2) EXAMPLES/TEST CASES
   Input: 30, 70
   Output: 2020, 2060, 40

   EDGE CASES:
   Input: 30, 30
   Output: 2020, 2020, 0

3) DATA STRUCTURE

4) ALGORITHM
   0. years left till retirement = age of retirement - current age
   1. retirement year = current year + years left till retirement

5) CODE
=end

require 'time'

def retrieve_current_age
   print ">> What is your age? "
   age = gets.chomp
end

def retrieve_retirement_age
   print ">> At what age would you like to retire? "
   retirement_age = gets.chomp.to_i
end

def years_till_retirement(retirement_age, current_age)
   retirement_age - current_age.to_i
end

def retirement_year(years_till_retirement)
   CURRENT_YEAR + years_till_retirement
end

CURRENT_YEAR = Time.new.year
current_age = retrieve_current_age()
retirement_age = retrieve_retirement_age()
years_until_retirement = years_till_retirement(retirement_age, current_age)
year_of_retirement = retirement_year(years_until_retirement)

puts "It's #{CURRENT_YEAR}. You will retire in #{year_of_retirement}."
puts "You have only #{years_until_retirement} years to go!"
  