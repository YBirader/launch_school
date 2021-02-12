=begin
Q: Write a method that takes an arbitary matrix and rotates it 90 degrees clockwise.


1) UNDERSTAND THE PROBLEM
   INPUTS: an array of arrays (matrix)
   OUTPUTS: matrix, rotated 90 degrees clockwise
   
   PROBLEM DOMAIN:
   
   RULES:
   - matrix has m rows and n columns
   - matrix elements indexed as i,j
   - 90 degree clockwise rotation def: transpose + each row reversed
   
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a matrix, find its transpose. Then, reverese every row.

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def transpose(matrix)
  m = matrix.first.size
  n = matrix.size

  (0...m).map do |i|
    (0...n).map do |j|
      matrix[j][i]
    end
  end
end

def rotate90(matrix)
  transpose(matrix).map(&:reverse)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# further exploration

def matrix180(matrix)
  result = []
  matrix.each do |row|
    result.prepend(row)
  end
  result.map(&:reverse)
end

p matrix180(matrix2) == [[8, 0, 1, 5], [2, 4, 7, 3]]

def matrix270(matrix)
  transpose(matrix.map(&:reverse))
end

p matrix270(matrix2) == [[2, 8], [4, 0], [7, 1], [3, 5]]

def matrix360(matrix)
  matrix
end

p matrix360(matrix2) == matrix2