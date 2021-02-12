=begin
Q: Write a method that implements a miniature stack-and-register-based programming language that has the listed commands.

1) UNDERSTAND THE PROBLEM
   INPUTS: specific command (string)
   OUTPUTS: command return value
   
   PROBLEM DOMAIN:
   - a stack is a list of values that grows and shrinks dynamically. The stack stores a list of values. The register stores the current value.
   
   RULES:
   - stack is implemented as an Array. push to add to the stack and pop to remove
   - has a stack and register
   - all operations are integer commands i.e. for division and modulo
   - register initialised to 0
   - commands can be chained as space delimited strings
   - command def: split string via delimiter ' '

   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Create a stack and register 

2) EXAMPLES/TEST CASES

   EDGE CASES:

3) DATA STRUCTURE
   array represents stack
   register is a variable

4) ALGORITHM
   

5) CODE
=end

VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']
STACK_POP_COMMANDS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP']

def is_integer?(value)
  value.to_i.to_s == value
end

def invalid_command?(command)
  (VALID_COMMANDS.include?(command) || is_integer?(command)) == false 
end

def empty_stack_error?(command, stack)
  stack.empty? && STACK_POP_COMMANDS.include?(command)
end

def minilang(commands)
  return 'NoCommandError' if commands.empty?
  register = 0
  stack = []
  commands.split.each do |command|
    return 'TokenError' if invalid_command?(command)
    return 'EmptyStackError' if empty_stack_error?(command, stack)
    case command
    when 'PUSH'  then stack.push(register)
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else
                 register = command.to_i
    end
  end
  nil
end



minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


minilang('3 PUSH 5 MOD PUSH 5 PUSH 4 MULT PUSH 7 PUSH 3 SUB ADD DIV PRINT')

p minilang('')

p minilang('END')