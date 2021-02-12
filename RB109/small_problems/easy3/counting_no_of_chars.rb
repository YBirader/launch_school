=begin
Q: write a program that will ask the user for an input of a word or multiple words and give back the number of characters. Spaces should not be
   counted as characters.

1) UNDERSTAND THE PROBLEM
   INPUTS: string/multi-word string
   OUTPUTS: number of chars (integer)
   PROBLEM DOMAIN:
   RULES:
   - spaces are not counted as characters i.e. if char == ' ', count ! += 1
   - remove breaking space
   - return 0 if empty string given
   CLARIFYING QUESTIONS:
   validate input? no
   MENTAL MODEL: givn a string, count the number of characters excluding whitespaces

2) EXAMPLES/TEST CASES
  Input: 'yusuf'
  Output: 5

  Input: 'yus uf'
  Output: 5

  EDGE CASES:
  Input: ' '
  Output: 0

3) DATA STRUCTURE
   array with elements correspoding to each character

4) ALGORITHM
   1. get the string from the user, ensuring breaking space removed
   2. split the string into an array, with char elements
   3. remove any whitetspace from the characters
   4. count the number of elements
   5. return count

5) CODE
=end

# method 1

=begin
def get_string
  puts "Please write a word or multiple words:"
  gets.chomp
end


def count_chars(string)
  num_of_chars = string.chars.select { |char| char != " " }.count
  puts "There are #{num_of_chars} characters in \"#{string}\"."
end

count_chars(get_string)
=end


# method 2


def get_string
  puts "Please write a word or multiple words:"
  gets.chomp
end


def count_chars(string)
  num_of_chars = string.count("^\s")
  puts "There are #{num_of_chars} characters in \"#{string}\"."
end

count_chars(get_string)