name = 'Bob'  # name references 'Bob'
save_name = name # save_name also references 'Bob' at same memory address
name = 'Alice' # name references 'Alice' at new memory address
puts name, save_name # => 'Alice', 'Bob'

name = 'Bob' # name set to reference 'Bob'
save_name = name # save_name set to reference 'Bob' at same memory address
name.upcase! # 'Bob' directly mutated and becomes uppercase at original memory address
puts name, save_name # => 'BOB', 'BOB'