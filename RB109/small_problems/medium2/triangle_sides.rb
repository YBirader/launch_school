=begin
Q: Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol, :equilateral, :isosceles, :scalene, or :invalid,
   depending on the type of triangle.


1) UNDERSTAND THE PROBLEM
   INPUTS: length of three sides of triangle (int/float)
   OUTPUTS: triangle type (symbol)
  
   PROBLEM DOMAIN:
   - triangle- a shape where the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have
     lengths greater than 0.
   
   RULES:
   - triangle def: a + b > c && a * b * c != 0, where a and b are the 2 shorter sides and c is the hypotenuse
   - equilateral def: a == b && b == c && c == a
   - isosceles def: a == b && b != c || a == c && a !=b || b == c && b != a
   - scalene def: a != b && b != c && a != c
   = return invalid if triangle is invalid

   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given the side lengths of a triangle, determine if the side lengths relate to a valid triangle. If they dont, then return invalid; otherwise,
   determine the type of triangle and return the relevant type.

2) EXAMPLES/TEST CASES
   Input: 3, 3, 3
   Output: equilateral

   EDGE CASES:

3) DATA STRUCTURE
   

4) ALGORITHM
   1. determine if the triangle is valid for sides a, b, c
        - create an array [a, b , c] and sort numerically
        - return :invalid unless a * b * c != 0 && (array[0] + array[1] > array[2])
   2. determine the triangle type
        if a == b && b == c && c == a
          return :equilateral
        elsif a == b && b != c || a == c && a !=b || b == c && b != a
          return :isosceles
        else 
          return :scalene
5) CODE
=end

def valid_triangle?(a, b, c)
  sides = [a, b, c].sort
  a * b * c != 0 && sides[0] + sides[1] > sides[2]
end


def triangle(side1, side2, side3)
  return :invalid unless valid_triangle?(side1, side2, side3)
  
  if side1 == side2 && side2 == side3 
    :equilateral
  elsif side1 == side2 || side2 == side3 || side3 == side1
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# method 2

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max
  
  case 
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
