def transpose(matrix)
   m = matrix.first.size
   n = matrix.size
  result = m.times.inject([]) do |row, _|
             row << Array.new(n, ' ')
  end

  for i in (0...n) do
    for j in (0...m) do
      result[j][i] = matrix[i][j]
    end
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# method 2

def transpose(matrix)
  m = matrix.first.size
  n = matrix.size

  (0...m).map do |i|
    (0...n).map do |j|
      matrix[j][i]
    end
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]