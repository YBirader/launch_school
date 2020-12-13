# Q1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?("Spot") # => false
p ages.has_key?("Spot") # => false
p ages.key?("Spot") # => false
p ages.member?("Spot") # => false

# Q2

munsters_description = "The Munsters are creeoy in a good way."
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.upcase!
munsters_description.downcase!

# Q3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237}
ages.merge!(additional_ages)

# Q4

advice = "Few things in life are as important as house training your pet dinosaur."
advice.match?("Dino")

# Q5

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Bambam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty Bambam Pebbles)

# Q6

flintstones = %w(Fred Barney Wilma Betty Bambam Pebbles)
flinstones << "Dino"
flintstones.push("Dino")
flintstones.append("Dino")

# Q7

flintstones = %w(Fred Barney Wilma Betty Bambam Pebbles)
flintstones.push("Dino", "Hoppy")
flintstones.append("Dino", "Hoppy")
flintstones.concat(%w(Dino Hoppy))

# Q8

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index("house")) # => "Few things are as important as "

# Q9

statement = "The Flintstones Rock!"
statement.count('t')

# Q10

title = "Flintstone Family Members"
title.center(40)
