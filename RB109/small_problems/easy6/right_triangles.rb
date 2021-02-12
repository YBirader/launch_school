=begin
Q: Write a method that takes a positive integer, n, as an argument and displays a right triangle, whose sides have n stars.
   The hypotenuse of the triangle should have one end at the lower side of the traingle, and the other end at the upper right.


1) UNDERSTAND THE PROBLEM
   INPUTS: a positive integer
   OUTPUTS: a string i.e. right triangle
   P
   ROBLEM DOMAIN:
   RULES:
   - sides of triangle will be n units long
   - there will be n rows, where each row will be n units long
   - hypotenuse should go from lower left to upper right i.e. right sided right angled triangle
   - row def: row1: 4 spaces, 1 *, row2: 3 spaces 2 * ... row m: n-m + 1 spaces, m * where m = length of row = (1..n), n = no of rows
   - n will be a positive integer
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a number n, create n strings (rows) of a right triangle with the correct number of spaces and stars. Then, print
                 the rows out one by one vertically.

2) EXAMPLES/TEST CASES
   Input: 2
   Output: *
          **

    Input: 3
    Output: *
           **
          ***

   EDGE CASES:

3) DATA STRUCTURE
   create each row as a string

4) ALGORITHM
   1. create each row and print it on the screen
        - create a variable called current_row_number = 1
        - while current_row_number <= n
             create a variable called current_row = ""
             while length of current_row < n
              append ' ' to current_row (current row length - n + 1) times
              append '*' to current_row length of current row times
             end
             print current row
             increment current_row_number




            

5) CODE
=end

def triangle(n)
  current_row_number = 1
  while current_row_number <= n 
    current_row = ""
    while current_row.length < n 
      current_row << ' '*(n - current_row_number + 1)
      current_row << '*'*current_row_number
    end
    puts current_row
    current_row_number += 1
  end
end

#triangle(5)
#triangle(9)

# method 2

def triangle(n)
  n.times do |row_number|
    current_row = ""
    current_row << ' '*(n-row_number-1)
    current_row << '*'*(row_number+1)
    puts current_row
  end
end

triangle(5)
triangle(9)

# method 3 => inverse relationship between number of spaces and number of stars

def triangle(n)
  spaces = n - 1
  stars = 1

  n.times do |row_number|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)
triangle(9)

# further exploration
# print triangle upside down

def upside_triangle(n)
  spaces = 0
  stars = n 

  n.times do |row_number|
    puts (' ' * spaces) + ('*' * stars)
    stars -= 1
    spaces += 1
  end
end

upside_triangle(4)

