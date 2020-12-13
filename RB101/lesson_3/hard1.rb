# Q1

if false
  greeting = "hello world"
end

greeting #=> nil

# Q2

greetings = {a: 'hi'}
informal_greeting = greetings[:a] #=> 'hi'
informal_greeting << " there"  #=> 

puts informal_greeting #=> "hi there"
puts greetings #=> {a: 'hi there'}

# Q3
# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "one"
puts "two is: #{two}" #=> "two"
puts "three is: #{three}" #=> "three"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "one"
puts "two is: #{two}" #=> "two"
puts "three is: #{three}" #=> "three"

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one", "two")
  two.gsub!("two", "three")
  three.gsub!("three", "one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "two"
puts "two is: #{two}" #=> "three"
puts "three is: #{three}" #=> "one"

# Q4

def dot_seperated_ip_address?(input_string)
  dot_seperated_words = input_string.split(".")
  return false if dot_seperated_words.size != 4
  while dot_seperated_words.size > 0 do 
    word = dot_seperated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end