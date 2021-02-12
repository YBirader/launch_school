=begin
Q: Write a method that takes a first name, a space, and a last name passed as a single passed as a single String argument, and returns a string
   that contains the last name, a comma, a space, and the first name.


1) UNDERSTAND THE PROBLEM
   INPUTS: string
   OUTPUTS: string
   
   PROBLEM DOMAIN:
   RULES:
   - swap first name and last name and add delmiting ', '
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE
  split the name into an array, where the first element is the first name and the last element is the last name.

4) ALGORITHM
   1. split the name into an array called name_parts
   2. reverse name_parts
   3. join the array with the delimiter ', '
   

5) CODE
=end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# method 2

def swap_name(name)
  names = name.split
  "#{names.last}, #{names.first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
  