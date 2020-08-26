def capitalise(word)
  if word.length > 10
    word.upcase
  else
    word
  end
end

puts capitalise('Hello World')