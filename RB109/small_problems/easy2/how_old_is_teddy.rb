=begin
Q: Build a program that randomly generates and prints Teddys age. To get the age, you should generate a random
   number between 20 and 200
   
4) ALGORITHM
   0. Generate a random number between 20 and 200 i.e. rand(20, 200)
   1. Interpolate the number in the given string.

5) CODE
=end

def display_age
   age = rand(20..200)
   puts "Teddy is #{age} years old!"
end

display_age

#further_exploration

def retrieve_name
   puts ">> Enter your name:"
   name = gets.chomp
   if name.empty?
      name = 'Teddy'
   end
   name
end


def display_age
   name = retrieve_name()
   age = rand(20..200)
   puts "#{name} is #{age}."
end

display_age()
   