# Q1

def fun_with_ids
  a_outer = 42  
  b_outer = "forty two"   # assignment of variables causes variable to reference objects, located at given memory addresses
  c_outer = [42]          # labelled by their respective object_id. Note that, given a_outer and d_outer, although being technically different 
  d_outer = c_outer[0]    # objects have the same value, hence Ruby re-uses the memory address and thus they have the same object id.

  a_outer_id = a_outer.object_id    
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id      # object id's within the block are the same as before the block
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"    # variables are reassigned and thus reference different objects at different memory addresses
    c_outer = [44]              # thus, they now have different object id's. Note that a_outer and d_outer have different values
    d_outer = c_outer[0]        # thus Ruby is no longer able to point both variables to the same memory address i.e. cannot re-use the memory location

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id   # same object id's as before as inners reference outers via method definition
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."  # outer variables are still in scope so still reference the
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."  # the same memory addresses as inside the block
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # inner variables are out of scope
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # as they were defined inside the 
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # block, so their object_id's are
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # undefined
end

fun_with_ids()

# Q2

def fun_with_ids
  
  a_outer = 42
  b_outer = "forty two"   # assignment of variables causes variable to reference objects, located at given memory addresses
  c_outer = [42]          # labelled by their respective object_id. Note that, given a_outer and d_outer, although being technically different 
  d_outer = c_outer[0]    # objects have the same value, hence Ruby re-uses the memory address and thus they have the same object id.

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # outer variables outside the method are referencing different objects and thus addresses to the outer variables local to the method, even though
  # in this case, they have the same name. Thus the outer variables, outside of a method retain their object_id's before and after the method call.
  

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."   
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  # The inner variables, in this case, were defined within the method and thus are local to the method only. Hence, they are undefined outside of the relevant
  # method and thus do not have defined object ids.

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"  
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."  # outer variables outside of method are reassigned
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."  # to the outer variables local to the method through
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."  # arguments. These variables are not the same, even though, in this case, they have the same name
  puts                                                                                                   # however, as the object values are the same, Ruby reuses the memory address and thus they have the same object_id

  a_outer = 22
  b_outer = "thirty three"  # outer variables local to the method are reassigned and thus now reference different memory addresses so have different object ids
  c_outer = [44]            # a_outer and d_outer also now have different object ids given the objects have different values and thus Ruby is not able to re-use
  d_outer = c_outer[0]      # the same memory address

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer   # defines inner variables local to the method referencing the same respective memory addresses as the local outer variables
  c_inner = c_outer   # thus have the same object ids as the respective local outer variables.
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

fun_with_ids()

# Q3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" #=> creates a new string i.e. #+= is non-destructive
  an_array_param << "rutabaga" #=> appends value to self i.e. #<< is destructive
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=> "My string looks like this now: pumpkins"
puts "My array looks like this now: #{my_array}"   #=> "My array looks like this now: ["pumpkins", "rutabaga"]"

# Q4

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'  #=> a_string_param which references the same address as my_string is changed destructively
  an_array_param = ['pumpkins', 'rutabaga'] #=> an_array_param now references a different address to my_array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=> "My string looks like this now: "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}"   #=> "My array looks like this now: ["pumpkins"]"

# Q5

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" 
  an_array_param += ["rutabaga"] 
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=> "My string looks like this now: pumpkins"
puts "My array looks like this now: #{my_array}"   #=> "My array looks like this now: ["pumpkins", "rutabaga"]"

# Q6

def color_valid(color)
  color == "blue" || color == 'green'  #=> always returns a Boolean
end


