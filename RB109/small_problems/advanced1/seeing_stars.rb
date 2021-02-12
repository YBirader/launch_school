=begin
Q: Write a method that dispalys an 8-pointed star in an n by n grid, where n is an odd integer that is supplied as an argument to the method. The smallest
   such star that needs to be handles is a 7 by 7 grid i.e. n = 7.


1) UNDERSTAND THE PROBLEM
   INPUTS: dimensions of grid, n (integer)
   OUTPUTS: 8-pointed star in an n by n grid
   
   PROBLEM DOMAIN:
   
   RULES:
   - dimension of grid is always equal to or greater than 7 i.e. n >= 7
   - star has a central line of symmetry
   - rows def: first half def: left_space=(0..n/2-1), star=1 middle_spaces=(n/2-1..0), star=1, middle_spaces, star=1, left_space
               middle line: stars=n 
               second_half+ left_space=(n/2-1..0), star=1, middle_spaces(0..n/2-1),star=1, middle_spaces, star=1, left_space
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given an integer n, create the upper half of a 8-pointed star by printing row by row. Do the same for the bottom_half. Add a central
   line of 8 stars in the middle to seperate the two halves.

2) EXAMPLES/TEST CASES


   EDGE CASES:

3) DATA STRUCTURE
   string

4) ALGORITHM
   1. create the upper half of the 8-pointed star
       - create a variable called left_space = 0
       - create a variable called middle_spaces = n/2-1
       - iterate continously:
           break if left_space == n/2-1
           print ' '*left_space + '*' + ' '*middle_spaces + '*' + ' '*middle_spaces + '*' + left_space
           increment left_space
           decrement middle_spaces
   2. create the middle line
        print '*'*n 
   3. create the lower half of the 8-pointed star
       - create a variable called left_space = n/2-1
       - create a variable called middle_spaces = 0
       - iterate continously
           break if left_space == 0
           print ' '*left_space + '*' + ' '*middle_spaces + '*' + ' '*middle_spaces + '*' + left_space
           increment middle_spaces
           decrement left_space


5) CODE
=end

def star(n)
  end_space = 0
  middle_space = n/2 - 1
  loop do 
    break if end_space > n/2 - 1
    puts ' '*end_space + '*' + ' '*middle_space + '*' + ' '*middle_space + '*' + ' '*end_space
    end_space += 1
    middle_space -= 1
  end

  puts '*'*n 

  end_space = n/2 - 1
  middle_space = 0
  loop do
    break if end_space < 0
    puts ' '*end_space + '*' + ' '*middle_space + '*' + ' '*middle_space + '*' + ' '*end_space
    middle_space += 1
    end_space -= 1
  end
end

star(7)
star(9)



# method 2- DRYer method- method uses distance from symmetry axis i.e. centre, to parametrise no of spaces on each row.

def print_row(grid_size, distance_from_centre)
  number_of_spaces = distance_from_centre - 1
  spaces = ' '*number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*'*grid_size
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

star(7)

# further exploration

def initialise_grid(grid_size)
  grid_size.times.inject([]) { |grid, _| grid << Array.new(grid_size, ' ')}
end

def draw(grid)
  grid.each do |row|
    puts row.join
  end
end

def circle(grid_size)
  grid = initialise_grid(grid_size)
  radius = (grid_size - 1) / 2
  0.upto(360) do |angle|
    x = radius + (Math.cos(angle) * radius).round
    y = radius + (Math.sin(angle) * radius).round
    grid[x][y] = '*'
  end
  draw(grid)
end

circle(11)

def sine_wave(grid_size)
  grid = initialise_grid(grid_size)
  delta = 0.01
  delta.step(by: delta, to: grid_size - 1) do |rad|
    x = (rad / grid_size.to_f - 0.5) * 2 * Math::PI 
    y = ((Math.sin(x) * ((grid_size-1)/2)) + ((grid_size-1)/2)).round
    grid[y][rad] = '*'
  end

  draw(grid)
end

sine_wave(21)