=begin
Q: Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian fraction
   representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You may use
   the Rational class provided by Ruby.


1) UNDERSTAND THE PROBLEM
   INPUTS: a Rational number i.e. numerator, denominator
   OUTPUTS: array of denominators that are part of the egyptian fraction rep. of no.
   
   PROBLEM DOMAIN:
   - rational number- any number that can be expressed as a fraction
   - unit fraction- any fraction with one as the numerator
   - egyptian fraction- sum of series of distinct unit fractions
   
   RULES:
   - rational number = Sum of egyptian fractions
   - egyptian fraction def: num = 1/a + 1/b + 1/c ... where a, b, c ...  are integers
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a rational number; keep adding 1/a, where a is a natural nnumber. If the current_sum <= rational number, add a to an array. otherwise,
   continue if current_denominator > rational number.

2) EXAMPLES/TEST CASES
   Input: 2, 1
   Output: [1, 2, 3, 6]

   EDGE CASES:
   Input: 0, 0
   Output: [0]

3) DATA STRUCTURE
   array to store result

4) ALGORITHM
   1. create a variable called current_denominator = 1
   2. create an empty array called result = []
   3. create variable called current_sum = 0
   4. LOOP:
        if current_sum + 1/current_denominator < rational_number
          add 1 / current_denominator to current_sum
          append current_denominator to result
        elsif current_sum + 1/current_denominator == rational_number
          add 1 / current_denominator to current_sum
          append current_denominator to result
          break
        end
        increment current_denominator
  5. return result

5) CODE
=end

# method 1

def egyptian(rational_number)
  current_denominator = 1
  current_sum = 0
  result = []

  loop do
    break if current_sum > rational_number
    if current_sum + Rational(1, current_denominator) <= rational_number
      current_sum += Rational(1, current_denominator)
      result << current_denominator
    end
    current_denominator += 1
  end
  result
end

# method 2

def egyptian(target_value)
  result = []
  current_denominator = 1

  until target_value == 0
    if target_value - Rational(1, current_denominator) >= 0
      target_value -= Rational(1, current_denominator)
      result << current_denominator
    end
    current_denominator += 1
  end
  result
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def unegyptian(array)
  array.inject(0) { |memo, value| memo += Rational(1, value) }
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
