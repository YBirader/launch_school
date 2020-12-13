=begin
Q: Given a string, write a method palindrome_substrings which returns all of the substrings from a given string which are palindromes. 
   Consider palindrome words case-sensitive.

1) UNDERSTAND THE PROBLEM
   
   INPUTS: a string
   OUTPUTS: an array of string elements
   
   PROBLEM DOMAIN:
   Palindrome- a word which reads the same backwards and forwards. 
   Substring- A contiguous sequence of characters within a string. 
   
   RULES:
   1. palindrome => string == reversed string
   2. substring are all the letters/words to the right of the current reference character e.g. 'halo' => 'h', 'ha', 'hal', 'halo', 'a', 'al', 'alo', 'l', 'lo', 'o'
   3. Palindromes are case sensitive e.g. 'Dad' is not a palindrome but 'dad' is
   4. If an empty string is input, return an empty array
   5. The object returrned is different from the input
   6. A substring can only be a palindrome if it is 2 chars or longer.
   7. substring = if string has n chars, substrings are: string[0..0], ....string[0..n], string[1..1] => string[current_ref_character..range_of_characters considered]
   
   CLARIFYING QUESTIONS:
   1. Assume valid input? Yes
   2. Can a substring be repeated? Yes, but the palindromes returned should be unique 
   3. Will the string have any whitespace? Assume it doesnt

   MENTAL MODEL: Given a string, find all the substrings of that string, and return all the substrings which are palindromes

2) EXAMPLES/TEST CASES
   Input: "supercalifragilisticexpialidocious"
   Output: ["ili"]

   Input: "abcddcba"
   Output: ["bcddcb", "cddc", "dd"]

   Input: "palindrome"
   Output: []

   EDGE CASES:
   Input: ''
   Output: []

3) DATA STRUCTURE
   an array called substrings to store all the substrings of string
   an array called palindromes to store all the palindrome substrings

4) ALGORITHM
   0. initialise an empty array called substrings
   1. find the substrings in string
       - initialise a local variable called current_ref_character = 0
          - while current_ref_character < length of string
              -initialise a local variable called length_of_substring = 1
             while length_of_substring < length of string
               current_substring = current_string[current_ref_character..length_of_substring]
               append current_substring to substrings
               increment length_of_substring
          - increment current_ref_character
   2. for each substring in substrings 
        if substring == reversed substring
          append substring to palindromes
        else ignore it
   3. return palindromes

5) CODE
=end

def palindrome_substrings(string)
  palindromes = []
  substrings = find_substrings(string)
  substrings.each do |substring|
    if valid_substring?(substring) && is_palindrome?(substring)
      palindromes.push(substring)
    end
  end
  palindromes
end

def is_palindrome?(string)
  string == string.reverse
end

def find_substrings(string)
  substrings = []
  current_ref_character = 0
  while current_ref_character < string.length
    length_of_substring = 1
    while length_of_substring < string.length
      current_substring = string.slice(current_ref_character, length_of_substring)
      substrings.push(current_substring)
      length_of_substring += 1
    end
    current_ref_character += 1
  end
  substrings
end

def valid_substring?(string)
  string.length > 1
end


p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcba")
p palindrome_substrings("palindrome")
p palindrome_substrings('')
