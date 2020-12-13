=begin
Q: Build a program that asks the user for the length and width of a room in meters and then displays the area
   of the room in both square meters and square feet. 1sqm == 10.7639 sqft

1) UNDERSTAND THE PROBLEM
   INPUTS: length (float), width (float)
   OUTPUTS: area (float) in sqm and sqft
   
   PROBLEM DOMAIN:
   RULES:
   1. area in sqm = length * width
   2. area in sqft = (length * width) * SQFT_CONVERSION
   3. Output is a float, even if inputs are integers
   4. Inputs do not need to be validated
   5. Round output float to 2dp
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Determine the area of a room in both sqm and sqft

2) EXAMPLES/TEST CASES
   Input: 10, 7
   Output: 70.0, 753.47

   Input: 1, 1
   Ouptut: 1, 10.76

   EDGE CASES:

3) DATA STRUCTURE
   

4) ALGORITHM
  0. compute area in sqm
  1. compute area in sqft
  2. display values in a sentence (see example)

5) CODE
=end

SQM_TO_SQFT = 10.7639


def retrieve_length
  puts ">> Enter the length of the room in meters:"
  length = gets.chomp.to_f
end

def retrieve_width
  puts ">> Enter the width of the room in meters:"
  width = gets.chomp.to_f
end

def display_area
  area_in_sqm = retrieve_width * retrieve_length
  area_in_sqft = area_in_sqm * SQM_TO_SQFT
  puts "The area of the room is #{area_in_sqm.round(2)} square meters (#{area_in_sqft.round(2)} square feet)."
end
  
display_area()

#further-exploration
SQFT_TO_SQINCH = 144
SQFT_SQCM = 929.03

def retrieve_length_ft
  puts ">> Enter the length of the room in feet:"
  length = gets.chomp.to_f
end

def retrieve_width_ft
  puts ">> Enter the width of the room in feet:"
  width = gets.chomp.to_f
end

def display_area_again
  area_in_sqft = retrieve_width_ft * retrieve_length_ft
  area_in_inches = area_in_sqft * SQFT_TO_SQINCH
  area_in_sqcm = area_in_sqft * SQFT_SQCM
  puts "The area of the room is #{area_in_inches.round(2)} square inches (#{area_in_sqcm.round(2)} square centimetres)."
end

display_area_again()
