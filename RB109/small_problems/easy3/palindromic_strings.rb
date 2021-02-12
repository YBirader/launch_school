=begin
Q: Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. T
   his time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
   If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

ALGORITHM

1. create variable called clean_string which removes all non-alphanumeric characters from string
     - split string into constiuent chars 
     - for char in chars
        select char if char is alphanumeric, where alphanumeric = (a..z) + (0..10)
     - join chars back into string
2. if string is palindromic (case-insensitive) i.e. string.downcase == string.downcase.reverse, return true

CODE
=end

ALPHANUMERIC = (0..10).to_a + ('a'..'z').to_a

def real_palindrome?(string)
  clean_string = remove_non_alphanumeric(string).downcase
  clean_string == clean_string.reverse
end

def remove_non_alphanumeric(string)
  string.chars.select { |char| ALPHANUMERIC.include?(char.downcase) }.join
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# method 2

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  string == string.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false