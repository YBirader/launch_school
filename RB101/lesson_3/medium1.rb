# Q1

10.times { |index| puts ((" " * index) + "The Flintstones Rock!") }

# Q2

puts "the value of 40 + 2 is " + (40 + 2) #=> Error- Cannot concatenate integer in a string. Need to convert to string literal or interpolate.
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}."

# Q3

def factors(number)  # raises error for 0 and causes infinite loop for negative numbers
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if number % divisor == 0 # checks if divisor is a multiple of number i.e. if there is no remainder from division
    divisor -= 1
  end
  factors #=> returns the factors array, containing all the factors of array
end

# Q4

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element #=> appends new element to buffer, destructively 
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] #=> appends new_element to a copy of buffer i.e. non-destructively 
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

#=> First method is changes the users inout array, buffer, destructively. In the second implementation, the input_array
#   is not chnaged given #+ is non-mutating. However, both methods return the same thing.

# Q5

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit) # limit must be passed in as an argument given method has self-contained scope so limit is not visible to method directly.
puts "result is #{result}."

# Q6

answer = 42

def mess_with_it(some_number)
  some_number += 8 
end

new_answer = mess_with_it(answer) #=> 50
p answer - 8 #=> 34

# Q7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member| #=> iterates over each element of demo_hash which points to munsters
    family_member["age"] += 42 #=> changes the object_id of the "age" value
    family_member["gender"] = "other" #=> changes the object_id of the "gender" value
  end
end

mess_with_demographics(munsters) 

# The demo_hash local method variable starts off by pointing to the munsters hash. For collections/lists, Ruby is passed the 
# the object_id of each item, not the parameter collection value. Hence, when the individual  value is reassigned, whilst the individual object_id
# of the value is changed non-destructively, both demo_hash and munsters are still pointing to the same hash structure, thus changing the values of
# demo_hash, even if it is non-destructively, shows changes both with demo_hash and munsters. If demo_hash was reassigned within the method,
# then the variable would point to an entirely different object_id compared to munsters and munsters would be preseved from any changes. This works
# the same as arrays.

# Q8

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps ("rock", "scissors")), "rock") #=> "paper"

# Q9

def foo(param = "no")  #=> foo always returns "yes"
  "yes"   
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) #=> "no"


                 