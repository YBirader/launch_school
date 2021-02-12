=begin
Q: In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, 
   unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.
   Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, 
   and returns true if the year is a leap year, or false if it is not a leap year.

1) UNDERSTAND THE PROBLEM
INPUTS: a year (greater than 0)
OUTPUTS: Boolean (true if leap year, false otherwise)

PROBLEM DOMAIN:
leap year- a year which has 366 days
RULES:
- leap year: year % 400 == 0 || year % 4 == 0 && year % 100 != 0 
             
- return true if year is a lap year
- assume year is greater than 0

CLARIFYING QUESTIONS:
MENTAL MODEL: Given a Gregorian year, return true if that year corresponds to a leap year, false otherwise

2) EXAMPLES/TEST CASES
Input: 2016
Output: false

Input: 2400
Output: true

EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM
   1. year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
        
5) CODE
=end

def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# method 2

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      year % 400 == 0 ? true : false
    else
      true
    end
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

=begin
Pt 2: The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. 
      Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.
      Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
=end

def leap_year?(year)
  if year % 4 == 0
    return true if year < 1752
    if year % 100 == 0
      year % 400 == 0 ? true : false
    else
      true
    end
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true