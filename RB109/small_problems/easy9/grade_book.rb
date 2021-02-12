=begin
Q: Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with 
   that grade. All input scores will be between 0 and 100 inclusive.


1) UNDERSTAND THE PROBLEM
   INPUTS: scores (integers)
   OUTPUTS: grade (string)
   
   PROBLEM DOMAIN:
   
   RULES:
   - consider three score
   - mean def: num1 + num2 + num3 / 3
   - scores-grade conversion def: score included in: 90..100 => 'A', 80...90 => 'B', 70...80 => 'C', 60...70 => 'D', 0...60 => 'F'
   - all scores are integers between 0 and 100 inclusive
   
   
   CLARIFYING QUESTIONS:
when computing average, should we round up or down? treat as integer so round down. Note that there is an edge case for when computed means
  are verry close to a grade boundary- dont know whether to round up or down. Use float for accuracy.
   MENTAL MODEL: Given three integers, compute their mean. Then, check what grade that mean corresponds to and return that grade.

2) EXAMPLES/TEST CASES
   Input: 95, 90, 93
   Output: "A"

   EDGE CASES:

3) DATA STRUCTURE
   use float to compute the mean

4) ALGORITHM
   1. compute the mean of the 3 numbers
       - average_score = num1 + num2 + num3 / 3 
   2. get the corresponding grade for that score
        - if average_score is included in range (90..100)
            return 'A'
elsif average_score is included in range (80...90)
  return 'B'
elsif average_score is included in range (70...80)
  return 'C'
elsif average_score is included in range (60...70)
  return 'D'
elsif average_score is included in range (0...60)
  return 'F'

5) CODE
=end

NUMBER_OF_SCORES = 3

def get_grade(score_1, score_2, score_3)
  average_score = (score_1 + score_2 + score_3) / NUMBER_OF_SCORES
  return 'A+' if average_score > 100
  case average_score
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  else                'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 120, 140) == 'A+'

# method 2

def get_grade(score_1, score_2, score_3)
  average_score = (score_1 + score_2 + score_3).to_f / NUMBER_OF_SCORES
  case
  when (90..100).cover?(average_score) then 'A'
  when (80...90).cover?(average_score) then 'B'
  when (70...80).cover?(average_score) then 'C'
  when (60...70).cover?(average_score) then 'D'
  else                                      'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"