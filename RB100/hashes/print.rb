my_hash = { name: 'Yusuf', age: 21, height: '6ft', country: 'U.K.' }

my_hash.each_key { |key| puts key }
my_hash.each_value { |value| puts value }
my_hash.each { |key, value| puts "This is the key #{key} with value #{value}."}

