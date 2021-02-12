=begin
Q: Write a method that counts the number of occurences of each element in a given array.

1) UNDERSTAND THE PROBLEM
   INPUTS: an array
   OUTPUTS: a hash
   
   PROBLEM DOMAIN:
   occurences- the number of times a given element appears in the input array.
  
   RULES:
   1. The elements of the array are case-sensitive e.g. 'suv' != 'SUV'
   2. The occurence number is given as an integer

   CLARIFYING QUESTIONS:
   1. Are the elements of the array always strings? No, but you can assume all of the elements will be of the same type.
   2. Empty Array? An array will never be empty
   
   MENTAL MODEL: Count the number of times each unique element of an array occurs and return the number of 
   occurences for each value.

2) EXAMPLES/TEST CASES
   Input: ['yusuf', 'birader', 'hello', 'yusuf']
   Output: {'yusuf' => 2, 'birader' => 1, 'hello' => 1}

   EDGE CASES:


3) DATA STRUCTURE
   Store the unqiue elements of the array as hash keys and the number of occurences 
   as the corresponding hash value. 

4) ALGORITHM
   1. Create an empty hash called occurences 
   2. for each element in array
        if occurences does not have key, element, then occurences[element] = 1
        else occurences[element] += 1
   3. return occurences

5) CODE
=end

# case-sensitive- method-one

def count_occurences(array)
   occurences = {}
   array.each do |element|
      if occurences.has_key?(element)
         occurences[element] += 1
      else
         occurences[element] = 1
      end
   end
   occurences.each { |element, value| puts "#{element} => #{value}" }
end

vehicles = [
   'car', 'car', 'truck', 'car', 'SUV', 'truck',
   'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurences(vehicles)

# case-sensitive- method two

def count_occurences_again(array)
   occurences = {}
   array.uniq.each do |element|
      occurences[element] = array.count(element)
   end

   occurences.each { |element, value| puts "#{element} => #{value}" }
end

count_occurences_again(vehicles)

# case-insensitive

other_vehicles = [
   'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
   'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurences_insensitive(array)
   occurences = {}
   array.map(&:downcase).each do |element|
     if occurences.has_key?(element)
       occurences[element] += 1
     else
      occurences[element] = 1
     end
   end
   occurences.each { |element, value| puts "#{element} => #{value}" }
end

count_occurences_insensitive(other_vehicles)
