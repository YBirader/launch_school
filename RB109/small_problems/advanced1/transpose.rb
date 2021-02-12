=begin
Q: Write a method that takes a 3 by 3 matrix in an Array of Arrrays format, and return the transpose of the original matrix.


1) UNDERSTAND THE PROBLEM
   INPUTS: an n by n matrix (2d array)
   OUTPUTS: transpose of matrix
   
   PROBLEM DOMAIN:
   
   RULES:
   - matrix is n by n i.e. no of rows == no of columns
   - rows/columns def: index via i, j i.e. ith row and jth column
   - transpose def: for all i, j where i != j, swap array[i][j] with array[j][i]
   - return a new matrix

   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a matrix, set the row and column indices to 0. For each element i, j, swap element with element at position, j, i. Return new array.

2) EXAMPLES/TEST CASES
   Input: [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
   Output: [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

   EDGE CASES:

3) DATA STRUCTURE
   array

4) ALGORITHM
   1. create an empty n by n grid
       - create n by grid called result
   2. for each index i in matrix
        for each index j in matrix
          result[j][i] = matrix[i][j]
    3. return result

5) CODE
=end

def transpose(matrix)
  dimensions = matrix.size
  result = dimensions.times.inject([]) do |row, _|
             row << Array.new(dimensions, ' ')
  end

  for i in (0...dimensions) do
    for j in (0...dimensions) do
      result[j][i] = matrix[i][j]
    end
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# method 2

def transpose(matrix)
  dimensions = matrix.size
  result = []
  (0...dimensions).each do |i|
    new_row = (0...dimensions).map { |j| matrix[j][i] }
    result << new_row
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# further exploration

def transpose!(matrix)
  dimensions = matrix.size
  dimensions.times do |i|
    (i...dimensions).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

p transpose!(matrix).object_id == matrix.object_id
    