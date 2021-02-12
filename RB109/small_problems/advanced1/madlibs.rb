=begin
Q: Create a madlibs program that reads in text from a .txt file and plugs in a selection of randomized nouns, verbs and adjectives, and adverbs
   into that text and prints it


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



ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg cat tail).freeze
VERBS = %w(spins bites licks hurdles).freeze
ADVERBS = %w(easily lazily noisly excitdely).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun: NOUNS.sample,
                      verb: VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb: ADVERBS.sample)
  end
end
