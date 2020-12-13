# Q1- How would you order this array of number strings by descending numeric value?
# Method 1
arr = ['10', '11', '9', '7', '8']
sorted_arr1 = arr.sort_by { |num| num.to_i }.reverse
# Method 1
sorted_arr2 = arr.sort { |num1, num2| num2.to_i <=> num1.to_i }

# Q2- How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_by_year = books.sort_by do |hsh|
  hsh[:published]  # all dates are same length strings so can compare without converting to integers
end

# Q3- For each of these collection objects demonstrate how you would reference the letter 'g'.


arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[2][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)

# Q4- For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

# Q5- figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |details|
  if details["gender"] == "male"
    total_male_age += details["age"]
  end
end

# Q6- print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end

# Q7- what would be the final values of a and b?

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2  # a is still 2 as we reference the array, not a
arr[1][0] -= a  # b is now [3, 8] as individual element has been reassigned.

# Q8- Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)
detected_vowels = []
hsh.each do |_, words|
  words.each do |word|
    word.chars.each do |char|
      detected_vowels << char if VOWELS.include?(char)
    end
  end
end

# Q9- Given this data structure, return a new array of the same structure but with the sub arrays being ordered 
#     (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

# Q10- use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end

# Q11- return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_array|
  sub_array.select do |int|
    int % 3 == 0
  end
end

# Q12- return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.each_with_object({}) do |sub_array, hsh|
  hsh[sub_array[0]] = sub_array[1]
end

# Q13-  return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_array|
  sub_array.select do |int|
    int.odd?
  end
end

# Q14- return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map(&:capitalize)
  elsif details[:type] == 'vegetable'
    details[:size].upcase 
  end
end

# Q15- return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? { |num| num.even? }
  end
end

# Q16- Write a method that returns one UUID when called with no parameters.
# Note: For proper UUID generation, use SecureRandom.uuid instead
def create_uuid
  possible_chars = ('1'..'9').to_a + ('a'..'f').to_a
  sections = [8, 4, 4, 4, 12]
  uuid = ''

  sections.each_with_index do |num, index|
    num.times { uuid << possible_chars.sample }
    uuid << '-' unless index == sections.length - 1
  end
  uuid
end


  
  


















    


