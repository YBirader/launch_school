require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(string)
  puts ">> #{string}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(flt)
  return true if /^\d[.]/.match(flt) # edge case '1.'.to_f => 1.0
  flt.to_f.to_s == flt
end

def valid_operation?(op)
  %w(1 2 3 4).include?(op)
end

def operation_message(operation, lang)
  case operation
  when '1' then messages('add', lang)
  when '2' then messages('multiply', lang)
  when '3' then messages('subtract', lang)
  when '4' then messages('divide', lang)
  end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def valid_language?(lang)
  lang if %w(en es).include?(lang)
end

def zero_division_error?(num1, num2, operation)
  if (num1 != '0') && (num2 == '0') && (operation == '4')
    true
  else
    false
  end
end

language = ''
loop do
  prompt(messages('language'))
  language = gets.chomp
  break if valid_language?(language)
  prompt(messages('valid_language'))
end

name = ''
loop do
  prompt(messages('welcome', language))
  name = gets.chomp
  break unless name.empty?
  prompt(messages('valid_name', language))
end

loop do
  first_number = ''
  second_number = ''
  operation = ''

  puts format(messages('greeting', language), name: name)

  loop do
    prompt(messages('first_number', language))
    first_number = gets.chomp
    break if valid_number?(first_number)
    prompt(messages('valid_number', language))
  end

  loop do
    prompt(messages('second_number', language))
    second_number = gets.chomp
    break if valid_number?(second_number)
    prompt(messages('valid_number', language))
  end

  loop do
    prompt(messages('operation', language))
    operation = gets.chomp
    if zero_division_error?(first_number, second_number, operation)
      prompt(messages('zero_division_error', language))
    elsif valid_opeartion?(operation)
      break
    end
  end

  prompt(messages('valid_operator', language))
  puts format(messages('computing_operation', language),
              operation: operation_message(operation, language))

  result = case operation
           when '1' then first_number.to_i + second_number.to_i
           when '2' then first_number.to_i * second_number.to_i
           when '3' then first_number.to_i - second_number.to_i
           when '4' then first_number.to_f / second_number.to_f
           end
  puts format(messages('result', language), result: result)

  prompt(messages('repeat_calculation', language))
  response = gets.chomp.downcase
  break unless response.start_with?('y')
end

prompt(messages('goodbye', language))
