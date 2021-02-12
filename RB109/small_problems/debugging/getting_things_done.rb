def move(n, from_array, to_array)
  return if n <= 0
    to_array << from_array.shift
    move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)
move(-1, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']


# error was that base case had been left out from recursion, leading to a stack overflow. Also, made sure that base case included for negative n values.