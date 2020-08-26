numbers = Array(1..10)
odd_numbers = numbers.select { |number| number % 2 == 1}
p odd_numbers
