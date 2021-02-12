def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'


# error was that name was being converted to an array, which is a new object, which was being mutated. To mutate the original object, name, we cannot
# change its data type.