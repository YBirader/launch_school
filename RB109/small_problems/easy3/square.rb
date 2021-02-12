# Q: Using the multiply method from multiplying_two_numbers.rb, write a method that computes the square of its argument

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25 #=> true
p square(-8) == 64 #=> true

# further_work
def general_exponent(n, m)
  if m == 0
    0
  elsif m == 1
    n 
  else
    multiply(general_exponent(n, m-1))
  end
end