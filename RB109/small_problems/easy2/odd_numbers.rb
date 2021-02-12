# Q: Print all the odd numbers from 1 to 99 inclusive. All numbers should be printed on seperate lines.

puts (1..99).select { |num| num % 2 != 0 }
