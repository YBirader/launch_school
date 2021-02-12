=begin
Q: Write a method that takes a string as an argument, and returns a new string that contains the original value using a staggered
   capitalization scheme in which every other character is capitalized and the remaining characaters are lowercase. Characaters that
   are not letters should not be changed, but count as characaters when switching between uppercase and lowercase.

1) UNDERSTAND THE PROBLEM
   INPUTS: a string
   OUTPUTS: a string, where every other char is uppercased
   PROBLEM DOMAIN:
   RULES:
   - only alphabetic chars are changed, where alphabetic chars are a to z
   - chars at even index are uppercased i.e. if index is even then uppercase char
   - non-alphabetic chars should still be counted as index increments
   
   CLARIFYING QUESTIONS:
   return a new object? yes
   MENTAL MODEL: Given a string, go through each characater and uppercase those at even indices and lowercase those at odd indices, and return the new string

2) EXAMPLES/TEST CASES
   Input: 'hello YUsuf'
   Output: 'HeLlO YuSuF'

   EDGE CASES:

3) DATA STRUCTURE
   split string into constituent chars

4) ALGORITHM
   1. split string into constituent chars
   2. uppercase chars at even index and lowercase those at odd index
        - create variable called index = 0
        - for each char in chars
            map char uppercase if index is even
            map char downcase if index is odd
   3. join the changed chars back into a string

5) CODE
=end

def staggered_case(string)
  characters = string.chars.map.with_index do |char, idx|
    idx.even? ? char.upcase : char.downcase
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# further_exploration

def staggered_case(string, first_char_upcase=true)
  result = ''
  string.chars.each do |char|
    if first_char_upcase
      result << char.upcase
    else
      result << char.downcase
    end
    first_char_upcase = !first_char_upcase
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', false) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


