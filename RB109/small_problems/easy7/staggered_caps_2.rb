=begin
Q: 
1) UNDERSTAND THE PROBLEM
   INPUTS:
   OUTPUTS:
   PROBLEM DOMAIN:
   RULES:
   CLARIFYING QUESTIONS:
   MENTAL MODEL: 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM

5) CODE
=end



def staggered_case(string)
  index = 0
  characters = string.chars.map do |char|
    if char.match(/[a-zA-Z]/) && index.even?
      index += 1
      char.upcase
    elsif char.match(/[a-zA-Z]/)
      index += 1
      char.downcase
    else
      char
    end
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# further exploration

def staggered_case(string, include_non_alpha=true)
  index = 0
  characters = string.chars.map do |char|
    if char.match(/[a-zA-Z]/) && index.even?
      index += 1
      char.upcase
    elsif char.match(/[a-zA-Z]/)
      index += 1
      char.downcase
    else
      index += 1 if include_non_alpha
      char
    end
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'

