# Q: Write a function named xor, that takes two arguments and returns true, if exactly one of its arguments is truthy and false otherwise.

def xor?(arg1, arg2)
  !!(arg1 && !arg2 || arg2 && !arg1)
    
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == true
p xor?(5.even?, 4.odd?) == true