=begin
Q: Write a method that displays a 4-pointed diamond in an n times n grid, where n is an odd integer that is supplied as an argument to the
   method. You may assume that the argument will always be an odd integer.


1) UNDERSTAND THE PROBLEM
   INPUTS: side of grid, n (odd integer)
   OUTPUTS: n by n grid pointed diamond (string)
   
   PROBLEM DOMAIN:
   
   RULES:
   - grid must be n by n i.e. n rows of length n
   - diamond must be 4-pointed
   - n will be an odd integer
   - diamond consists of 2 equilaterial triangles
   - for top triangle, no of spaces on left * = (n/2..0), number of * = (1..n) in jumps of 2, no of spaces on right = (n/2..0)
     for bottom traingle, no of spaces on left * = (1..n/2), number of * = (n-1..1) in decrements of 2, no of spaces on right = (1..n/2)


   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer, create an equilateral triangle, where the each startting from the top row, each row has the form, m + j* + m, where
   m = (n/2..0) is the number of spaces and j = (1..n) in increments of two. Then, a bottom equilaterial triangle if created with rows of the form,
   m = (1..n/2), j = (n-1..1) in decrements of 2.

2) EXAMPLES/TEST CASES
   Input: 3
   Output: * 
          ***
           *

   EDGE CASES:

3) DATA STRUCTURE
   each row is a string

4) ALGORITHM
   1. create the top equilateral triangle
        - create a variable called number of spaces = n/2
        - create a variable called number of stars = 1
        while number_of_spaces >= 0
          print ''*number_of_spaces + '*'*numberofstars + ''*number_of_spaces
          decrement number_of_spaces
          increment number_of_stars by 2
   2. create the bottom equilateral triangle
       - create a variable called number of spaces = 1
       - create a variable called number of stars = n-2
       while number_of_stars >= 1
        print ''*number_of_spaces + '*'*numberofstars + ''*number_of_spaces
          increment number_of_spaces
          decrement number_of_stars by 2

5) CODE
=end

# method 1
# NB: try to keep code DRY

def diamond(n)
  number_of_spaces = n/2
  number_of_stars = 1
  while number_of_spaces >= 0
    puts ' '*number_of_spaces + '*'*number_of_stars + ' '*number_of_spaces
    number_of_spaces -= 1
    number_of_stars += 2
  end

  number_of_spaces = 1
  number_of_stars = n-2

  while number_of_stars >= 1
    puts ' '*number_of_spaces + '*'*number_of_stars + ' '*number_of_spaces
    number_of_spaces += 1
    number_of_stars -= 2
  end
end

diamond(1)
diamond(3)
diamond(9)

# method 2

=begin

RULES
- grid is n by n
- diamond triangle is symmetrical about the centre
- number of spaces and diamonds in row is a function of the distance from the centre row
   - max_distance = n / 2
   - row def: no of stars = n - (distance from centre * 2)
   where distance from centre = 0 at the centre
   - stars are centered
=end

def print_row(grid_size, distance_from_centre)
  number_of_stars = grid_size - (distance_from_centre * 2)
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = grid_size / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(9)

# further exploration
=begin
Q: Write a method that prints out the outline of a diamond.

Input: size of grid, n (integer)
Output: outline of diamond (string)

RULES:
- outline on n by n grid
- diamond is symmetrical about centre
- rows def: left space: n/2..0 star + middle space = (0..n/2),  right space: (n/2..0)
            left space: (1..n/2) star + middle space = (n/2-1..0), right space: (1..n/2)

=end

def print_row(grid_size, distance_from_centre)
  side_spaces = ' ' * distance_from_centre
  if distance_from_centre == grid_size / 2
    puts side_spaces + '*' + side_spaces
  else
    number_of_middle_space = (grid_size - 2 * distance_from_centre) - 2
    middle_space = ' ' * number_of_middle_space
    puts side_spaces + '*' + middle_space + '*' + side_spaces
  end
end


def diamond_outline(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond_outline(5)
diamond_outline(9)
            