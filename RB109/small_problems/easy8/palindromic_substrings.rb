=begin
Q: Write a method that returns a list of all substrings of a string that are palindromic i.e. each substring must consist of the same sequence of
   chars backwards and forwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes
   should be included multiple times.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: an array of palindromic substrings
   
   PROBLEM DOMAIN:
   - substring-  a contingous sequence of chars within a string
   - palindrome- a sequence of chars which is the same forwards as backwards. Palindromes have more than one char and are case sensitive.
   
   RULES:
   - palindrome def: a substring is palindromic if substring length > 1 && substring = reverse substring
   - duplicate palindromic substrings should be included
   - if no palindromes, return an emoty array
   - palindromes are case-sensitive

   CLARIFYING QUESTIONS:
   assume valid input? yes
   
   MENTAL MODEL: Given a string, find all the substrings of string. Then, select all the substrings which are palindromic and return the list.

2) EXAMPLES/TEST CASES
   Input: 'abcd'
   Output: []

   Input: 'dad'
   Output: ['dad']

   Input: 'Dad'
   Output: []

   EDGE CASES:

3) DATA STRUCTURE
   store substrings in an array

4) ALGORITHM
   1. find the substrings of string
   2. select all substrings which are palindromic
       - palindromic if substring length > 1 && substring ==  substring reversed

5) CODE
=end

def leading_substrings(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string[0, count]
  end
  substrings
end

def substrings(string)
  results = []
  (0...string.size).each do |ref_index|
    results.concat(leading_substrings(string[ref_index..-1]))
  end
  results
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select { |substring| substring.size > 1 && substring == substring.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# further_exploration

def is_palindrome?(substring)
  substring = substring.downcase.delete('^a-z')
  substring.size > 1 && substring == substring.reverse
end

