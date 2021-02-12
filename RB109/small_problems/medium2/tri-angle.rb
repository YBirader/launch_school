=begin
Q: Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending
   on the type of triangle. Assume that the arguments are integers and specified in degrees.


1) UNDERSTAND THE PROBLEM
   INPUTS: 3 angles of a triangle (integers)
   OUTPUTS: type of triangle (symbol)
   
   PROBLEM DOMAIN:
   - triangle- a shape, where the sum of the angles is 180 degrees, and all angles must be greater than 0.
   
   RULES:
   - valid triangle def: angle1 + angle2 + angle3 == 180 && angle1*angl2*angle3 != 0
   - right triangle def: angles include 90
   - acute angle def: all angles are less than 90 degrees
   - obtuse- any angle is greater than 90 degrees

   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given the three angles of a triangle, determine whether the triangle is valid. Return :invalid if it is not; otherwise, return
   the type of triangle.

2) EXAMPLES/TEST CASES
   Input: 60, 70, 50
   Output: :acute

   EDGE CASES:

3) DATA STRUCTURE
   store angle in an array

4) ALGORITHM
   1. determine if the triangle is valid
      - return :invalid unless sum of triangles == 180 & product of angles != 0
   2. determine the type of triangle
      - return :right if angles include 90
      - return :acute if all angles < 90
      - return :obtuse if any angle > 90
    

5) CODE
=end

def valid_triangle?(angles)
  angles.inject(:+) == 180 && angles.inject(:*) != 0
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless valid_triangle?(angles)
  if angles.include?(90)
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid  
