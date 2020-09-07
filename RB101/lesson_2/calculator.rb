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
  (num1 != '0') && (num2 == '0') && (operation == '4')
end

def calculate_result(first_number, second_number, operation)
  case operation
  when '1' then first_number.to_i + second_number.to_i
  when '2' then first_number.to_i * second_number.to_i
  when '3' then first_number.to_i - second_number.to_i
  when '4' then first_number.to_f / second_number.to_f
  end
end

def retrieve_number(num_order, lang)
  number = ''
  loop do
    prompt(messages(num_order, lang))
    number = gets.chomp
    break if valid_number?(number)
    prompt(messages('valid_number', lang))
  end
  number
end

def retrieve_language
  language = ''
  loop do
    prompt(messages('language'))
    language = gets.chomp.downcase
    break if valid_language?(language)
    prompt(messages('valid_language'))
  end
  language
end

def retrieve_name(lang)
  name = ''
  loop do
    prompt(messages('welcome', lang))
    name = gets.chomp
    break unless name.empty?
    prompt(messages('valid_name', lang))
  end
  name
end

def retrieve_operation(num1, num2, language)
  operation = ''
  loop do
    prompt(messages('operation', language))
    operation = gets.chomp
    if zero_division_error?(num1, num2, operation)
      prompt(messages('zero_division_error', language))
    elsif valid_operation?(operation)
      break
    end
  end
  prompt(messages('valid_operator', language))
  operation
end

def repeat_calculation(lang)
  response = ''
  loop do
    prompt(messages('repeat_calculation', lang))
    response = gets.chomp.downcase
    break if response == 'y' || response == 'n'
    prompt(messages('valid_response', lang))
  end
  response
end

language = retrieve_language
name = retrieve_name(language)
puts format(messages('greeting', language), name: name)

loop do
  first_number = retrieve_number('first_number', language)
  second_number = retrieve_number('second_number', language)
  operation = retrieve_operation(first_number, second_number, language)
  puts format(messages('computing_operation', language),
              operation: operation_message(operation, language))

  result = calculate_result(first_number, second_number, operation)
  puts format(messages('result', language), result: result)
  response = repeat_calculation(language)
  break unless response == 'y'
end

prompt(messages('goodbye', language))
