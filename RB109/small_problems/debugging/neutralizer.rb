def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# error in code occured because we were mutating the calling object during iteration, causing some words to be skipped. Never mutate the calling object
# during iteration to avoid this behaviour.

# alternative reject implementation

def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i])
      array.delete_at(i)
    else
      i += 1
    end
  end
  array
end