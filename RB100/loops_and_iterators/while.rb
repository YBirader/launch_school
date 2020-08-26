word = String.new
while word != 'NO'
  puts "How are you?"
  input = gets.chomp
  puts "Shall I ask again?"
  word = gets.chomp
end 

