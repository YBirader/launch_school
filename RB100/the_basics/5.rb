def factorial(n)
  if n < 0
    false
  elsif n == 1 || n == 0
    1
  else
    n * factorial(n-1)
  end
end

puts factorial(5)  
puts factorial(6)
puts factorial(7)
puts factorial(8)











