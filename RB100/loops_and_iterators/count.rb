def count(number)
  puts number
  if number < 1
    number
  else
    count(number - 1)
  end
end

count(10)
