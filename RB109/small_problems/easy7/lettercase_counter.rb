=begin
Q: Write a method that takes a String, and then returns a hash containing 3 entries; one represents the number of characters in the
   string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that
   are neither.


1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a hash { lowercase: int, uppercase: int, neither: int }
   PROBLEM DOMAIN:
   neither- a character that is not alphabetic i.e. is not included in 'a-zA-Z'
   RULES:
   - hash should be initilaised as { lowercase: 0, uppercase: 0, neither: 0 } i.e. not as found
   - lowercase def: if 'a-z' includes char 
   - uppercase def: if 'A-Z' includes char
   - neither def: if 'a-zA-Z' does not include char i.e. include whitespaces, punctuation etc.
   - all types of char must be considered e.g. alphabetic, non-alphanumeric etc.
   
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a string, find the number of lowercase chars, uppercase chars and non-cased chars. Then, create a hash to
                 store these values.

2) EXAMPLES/TEST CASES
   Input: 'yUs f'
   Output: { lowercase: 3, uppercase: 1, neither: 0 }

   EDGE CASES:
   Input: ''
   Output: { lowercase: 0, uppercase: 0, neither: 0 }

3) DATA STRUCTURE
   a hash

4) ALGORITHM
   1. find the number of lowercase, uppercase and non-cased chars
       - alphabetic_lowercase = 'a' to 'z'
       - alphabetic_uppercase = 'A' to 'Z'
       - create hash { lowercase: 0, uppercase: 0, neither: 0 }
       - for each char in string
           - increment hash lowercase value if alphabetic_lowercase includes char
           - increment hash upper_casse if alphabetic_lowercase includes char
           - hash neither = total number of chars - no of lowercase chars - no of uppercase chars
   2. return hash

5) CODE
=end

LOWERCASE_CHARS = ('a'..'z').to_a
UPPERCASE_CHARS = ('A'..'Z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    if LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    elsif UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  counts[:lowercase] += string.scan(/[a-z]/).size
  counts[:uppercase] += string.scan(/[A-Z]/).size
  counts[:neither] += string.scan(/[^a-zA-Z]/).size
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  counts[:lowercase] += string.count('a-z')
  counts[:uppercase] += string.count('A-Z')
  counts[:neither] += string.count('^a-zA-Z')
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
