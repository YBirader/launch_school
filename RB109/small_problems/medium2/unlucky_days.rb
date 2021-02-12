=begin
Q: Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752.


1) UNDERSTAND THE PROBLEM
   INPUTS: year (integer)
   OUTPUTS: no of Friday the 13ths
   
   PROBLEM DOMAIN:
   
   RULES:
   - year def: year has 365 days in year except 366 years in leap year
   - date object def: (year, month, 13)


   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

require 'date'

def friday_13th(year)
  counter = 0
  1.upto(12) do |month|
    counter += 1 if Date.new(year, month, 13).friday?
  end
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# method 2

def friday_13th(year)
  counter = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    counter += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# further exploration

def five_fridays(year)
  number_of_months = 0
  1.upto(12) do |month|
    day = 1
    current_date = Date.civil(year, month, day)
    number_of_fridays = 0
    loop do
      break if current_date.month == (month + 1) || current_date.year == year + 1
      number_of_fridays += 1 if current_date.friday?
      current_date = current_date.next_day
    end
    number_of_months += 1 if number_of_fridays == 5
  end
  number_of_months
end

p five_fridays(2019)
p five_fridays(2020)
p five_fridays(2021)


     





