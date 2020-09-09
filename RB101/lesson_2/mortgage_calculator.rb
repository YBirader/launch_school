require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')
MONTHS_IN_YEAR = 12

def messages(message, language='en')
  MESSAGES[language][message]
end

def prompt(string)
  puts ">> #{string}"
end

def retrieve_loan_amount(language)
  loan_amount = ''
  loop do
    prompt(messages('get_loan_amount', language))
    loan_amount = gets.chomp
    break if valid_amount?(loan_amount)
    prompt(messages('invalid_loan_amount', language))
  end
  loan_amount.to_f
end

def valid_amount?(num)
  /^\d+(\.\d{0,2})?$/.match(num) && num > '0'
end

def valid_rate?(rate)
  /^\d+(\.d*)?$/.match(rate)
end

def retrieve_loan_duration(language)
  loan_duration_years = ''
  loop do
    prompt(messages('get_loan_duration', language))
    loan_duration_years = gets.chomp
    break if valid_duration?(loan_duration_years)
    prompt(messages('invalid_loan_duration', language))
  end
  loan_duration_years.to_i
end

def loan_duration_in_months(loan_duration_years)
  loan_duration_years * MONTHS_IN_YEAR
end

def valid_duration?(num)
  /^\d+$/.match(num) && num > '0'
end

def retrieve_apr(language)
  apr = ''
  loop do
    prompt(messages('get_apr', language))
    apr = gets.chomp
    break if valid_rate?(apr)
    prompt(messages('invalid_apr', language))
  end
  apr.to_f
end

def monthly_int_rate(apr)
  apr / (100 * MONTHS_IN_YEAR)
end

def monthly_payment_rate(loan_duration_months, amount, monthly_interest)
  amount * (monthly_interest /
           (1 - (1 + monthly_interest)**(-loan_duration_months)))
end

def retrieve_language
  language = ''
  loop do
    prompt(messages('get_language'))
    language = gets.chomp.downcase
    break if valid_language?(language)
    prompt(messages('invalid_language'))
  end
  language
end

def valid_language?(language)
  %w(en es).include?(language)
end

def retrieve_name(language)
  name = ''
  loop do
    prompt(messages('get_name', language))
    name = gets.chomp
    break if valid_name?(name)
    prompt(messages('invalid_name', language))
  end
  name
end

def valid_name?(name)
  true unless name.empty? || /\s+/.match(name)
end

def total_interest(amount, loan_duration, monthly_interest_rate,
                   monthly_payment)
  total_interest_payable = 0
  balance = amount
  while loan_duration >= 0
    interest = balance * monthly_interest_rate
    balance -= monthly_payment - interest
    total_interest_payable += interest
    loan_duration -= 1
  end
  total_interest_payable
end

def total_payable(amount, total_interest)
  amount + total_interest
end

def repeat(language)
  response = ''
  loop do
    prompt(messages('repeat', language))
    response = gets.chomp.downcase
    break if valid_response?(response)
    prompt(messages('invalid_response', language))
  end
  response
end

def valid_response?(response)
  %w(y n).include?(response)
end

def format_currency(amount)
  format("%.2f", amount)
end

def clear_prompt
  system("clear") || system("cls")
end

language = retrieve_language()
clear_prompt()
name = retrieve_name(language)
puts format(messages('welcome', language), name: name)

loop do
  loan_amount = retrieve_loan_amount(language)
  loan_duration_years = retrieve_loan_duration(language)
  apr = retrieve_apr(language)
  clear_prompt()

  loan_duration_months = loan_duration_in_months(loan_duration_years)
  monthly_interest_rate = monthly_int_rate(apr)
  monthly_payment = monthly_payment_rate(loan_duration_months,
                                         loan_amount,
                                         monthly_interest_rate)
  total_interest_payable = total_interest(loan_amount, loan_duration_months,
                                          monthly_interest_rate,
                                          monthly_payment)
  total_payment = total_payable(loan_amount, total_interest_payable)

  puts format(messages('summary', language),
              amount: format_currency(loan_amount),
              duration: loan_duration_months,
              apr: apr,
              monthly_payment: monthly_payment.round(2),
              total_interest_payable: total_interest_payable.round(2),
              total_payment: total_payment.round(2))

  response = repeat(language)
  break unless response == 'y'
end

prompt(messages('goodbye', language))
