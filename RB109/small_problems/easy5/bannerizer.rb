=begin
Q: Write a method that will take a short line of text, and print it within a box.


1) UNDERSTAND THE PROBLEM
   INPUTS: string 
   OUTPUTS: string (input around a box)
   PROBLEM DOMAIN:
   RULES:
   - the box should have width scaled to the length of the text and constant height
   - width of box: width = '+' + ('-'*length of string + 2 )+ '+'
   - empty line: '|' + (length of string * ' ' + 2) + '|'
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a piece of text, print it centreted in a box.

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end

def print_in_box(string)
  horizontal_border = "+#{'-' * (string.length + 2)}+"
  empty_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_border
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_border
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# further_exploration

def truncate(string, columns)
  string.length > columns ? "#{string[0..columns]}..." : string
end

def print_in_box(string)
  string = truncate(string, 78)
  horizontal_border = "+#{'-' * (string.length + 2)}+"
  empty_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_border
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_border
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('This is a very long string, that is being used to test the new truncate feature of this program. I love to build things and have always loved it.')


