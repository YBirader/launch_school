# Q1

numbers = [1, 2, 2, 3]
numbers.uniq # => [1, 2, 3]
puts numbers # => [1, 2, 2,3] i.e. uniq non-destructive

# Q2

a) != means not equal to
b) !something means not something. Used to turn the object into the opposite of its Boolean value
c) method! implies the method may be destructive
d) ? something signifies a ternary operator
e) method? implies the method returns a Boolean
f) !!object turns the object into its Boolean equivalent

# Q3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")

# Q4

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # => deletes 2 at index 1
numbers.delete(1) # deletes the first occuring instance of 1

# Q5

(10..100).cover?(42) # => true

# Q6

famous_words = "seven years ago..."
"Four score and " + famous_words
"Four score and" << famous_words
famous_words.prepend("Four score and ")

# Q7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

# Q8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney") # => ["Barney", 2]


