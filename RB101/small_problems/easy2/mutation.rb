array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value } # array1 elements destructively copied to array2
array1.each { |value| value.upcase! if value.start_with?('C', 'S') } # Curly, Shemp, Chico destructively made uppercase in both array1 and array2
puts array2 # => Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo



