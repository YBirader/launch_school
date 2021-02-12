=begin
Q: Write a method that takes a year as input and returns the century. 
   The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.
   New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

1) UNDERSTAND THE PROBLEM
INPUTS: a year (integer)
OUTPUTS: a century (string)
PROBLEM DOMAIN:
century- a period of 100 years, New centuries begins in years that end with 01
RULES:
- need to output corresponding century to year
- new centuries end with 01
- century number: if year % 100 != 0, then century_number == (year / 100) + 1 else century_number == year / 100
- century number suffix is highlighted by the last digit of century_number except
   { 1 => 'st', 2 => 'nd', 3 => 'rd- 
- excepttion century_suffix-  if century_number % 100 == 11, 12, 13 then 'th'
CLARIFYING QUESTIONS:
MENTAL MODEL: given a year, find the century number corresponding to that year. 
              Then, add the correct suffix to that century number

2) EXAMPLES/TEST CASES
   Input: 2000
   Output: '20th'

   Input: 1965
   Output: '20th'

   Input: 256
   Output: '3rd'

EDGE CASES:

3) DATA STRUCTURE
   hash has the correct suffixes
   

4) ALGORITHM
   1. find the correct century for year
        - create a variable called century assigned to an empty string
        - if year % 100 != 0 then century_number == (year / 100) + 1 else century_number == year / 100
        - convert value to string and append to century_number
  2. find the correct suffix
       - if century_number % 100 == 11, 12, 13, then return 'th'
       - elsif century_number % 10 == 1 then 'nd'
       - elsif century_number % 10 == 2 then 'rd'
       - elsif century_number % 10 == 3 'th'
       - else 'th'
   3. concat correct_suffix to century number and return century_number

5) CODE
=end

def century(year)
   century_number = if year % 100 != 0
                      (year / 100) + 1
                    else
                      year / 100
                    end
   correct_suffix = century_suffix(century_number)
   century_number.to_s + correct_suffix
end

def century_suffix(century_number)
  return 'th' if [11, 12, 13].include?(century_number % 100)
  last_digit = century_number % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'