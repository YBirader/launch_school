words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl', 'veil', 
'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

ordered = Hash.new
words.each do |word|
  key = word.split("").sort.join
  if ordered.has_key?(key)
    ordered[key].push(word)
  else
    ordered[key] = [word]
  end
end

ordered.each_value { |anagrams| p anagrams }
