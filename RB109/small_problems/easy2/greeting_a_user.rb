=begin
Q: Write a program that will ask for the users name. The program will then greet the user. 
   If the user ends their name with '!', then the computer yells back to the user.

1) UNDERSTAND THE PROBLEM
   INPUTS: name 
   OUTPUTS: a greeting
   
   PROBLEM DOMAIN:
   yell- the yelled string is in upper case
   RULES:
   1. if users name includes '!', then return grreeting in uppercase 
   
   CLARIFYING QUESTIONS:
   1. Assume valid input? yes
   MENTAL MODEL: return a greeting to the user, which is in uppercase only if the user has an exclamation mark
                 at the end of their name.

2) EXAMPLES/TEST CASES
   Input: Bob
   Output: Hello Bob

   Input: Bob!
   Output: HELLO BOB!

   EDGE CASES:

3) DATA STRUCTURE
   an array to store name split into characters

4) ALGORITHM 
   0. split name in an array, with individual chars of name as elements
   1. if array includes '!', then display a greeting in uppercase
else display a greeting in lower case

5) CODE
=end

def retrieve_name
  print ">> What is your name? "
  name = gets.chomp
end

def shouted_name?(name)
  name[-1] == '!'
end

def display_greeting(name)
  if shouted_name?(name)
    puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

name = retrieve_name()
display_greeting(name)


