require 'yaml'
MESSAGES = YAML.load_file('rpsls.yml')
VALID_CHOICES = { 'r' => ['sc', 'l', 'scissors', 'lizard'],
                  'p' => ['r', 'sp', 'rock', 'spock'],
                  'sc' => ['p', 'sp', 'paper', 'spock'],
                  'l' => ['p', 'sp', 'paper', 'spock'],
                  'sp' => ['sc', 'r', 'scissors', 'rock'],
                  'rock' => ['sc', 'l', 'scissors', 'lizard'],
                  'paper' => ['r', 'sp', 'rock', 'spock'],
                  'scissors' => ['p', 'sp', 'paper', 'spock'],
                  'lizard' => ['p', 'sp', 'paper', 'spock'],
                  'spock' => ['sc', 'r', 'scissors', 'rock'] }
FULL_NAMES = { 'r' => 'rock',
               'p' => 'paper',
               'sc' => 'scissors',
               'l' => 'lizard',
               'sp' => 'spock' }
MAX_SCORE = 5

def messages(message, language='en')
  MESSAGES[language][message]
end

def prompt(string)
  puts ">> #{string}"
end

def welcome(name, language)
  puts format(messages('welcome', language), name: name)
end

def clear_screen
  system('cls') || system('clear')
end

def retrieve_language
  language = ''
  loop do
    prompt(messages('input_language'))
    language = gets.chomp.downcase
    language = format_language(language)
    break if valid_language?(language)
    prompt(messages('invalid_language', language))
  end
  language
end

def valid_language?(language)
  %w(en es).include?(language)
end

def format_language(language)
  case language
  when 'english' then 'en'
  when 'spanish' then 'es'
  else
    language
  end
end

def retrieve_name(language)
  name = ''
  loop do
    prompt(messages('input_name', language))
    name = gets.chomp
    break if valid_name?(name)
    prompt(messages('invalid_name', language))
  end
  name
end

def valid_name?(name)
  /^\w+/.match(name)
end

def retrieve_user_choice(language)
  user_choice = ''
  loop do
    prompt(messages('input_user_choice', language))
    user_choice = gets.chomp.downcase
    break if valid_choice?(user_choice)
    prompt(messages('invalid_user_choice', language))
  end
  user_choice
end

def display_rules(language)
  prompt(messages('rules', language))
end

def valid_choice?(user_choice)
  VALID_CHOICES.keys.include?(user_choice)
end

def retrieve_computer_choice
  FULL_NAMES.values.sample
end

def win?(player_one_choice, player_two_choice)
  VALID_CHOICES[player_one_choice].include?(player_two_choice)
end

def display_result(user_choice, computer_choice, language)
  if win?(user_choice, computer_choice)
    prompt(messages('user_won', language))
  elsif win?(computer_choice, user_choice)
    prompt(messages('computer_won', language))
  else
    prompt(messages('user_tie', language))
  end
end

def display_final_winner(scores, language)
  if scores[:user] > scores[:computer]
    prompt(messages('user_final_winner', language))
  else
    prompt(messages('computer_final_winner', language))
  end
end

def display_choices(user_choice, computer_choice, language)
  if FULL_NAMES.keys.include?(user_choice)
    user_choice = format_choice(user_choice)
  end
  puts format(messages('choices', language),
              user_choice: user_choice,
              computer_choice: computer_choice)
end

def format_choice(choice)
  FULL_NAMES[choice]
end

def display_score(scores, name, language)
  puts format(messages('scores', language),
              name: name,
              user_score: scores[:user],
              computer_score: scores[:computer])
end

def reset_scores(scores)
  scores[:user] = 0
  scores[:computer] = 0
end

def increment_score(user_choice, computer_choice, scores)
  if win?(user_choice, computer_choice)
    scores[:user] += 1
  elsif win?(computer_choice, user_choice)
    scores[:computer] += 1
  end
end

def play_again?(language)
  answer = ''
  loop do
    prompt(messages('repeat', language))
    answer = gets.chomp.downcase
    break if valid_response?(answer)
    prompt(messages('invalid_response', language))
  end
  answer == 'y' || answer == 'yes'
end

def valid_response?(response)
  %w(y n yes no).include?(response)
end

def game_over?(scores)
  scores[:user] == MAX_SCORE || scores[:computer] == MAX_SCORE
end

def goodbye(language)
  prompt(messages('bye', language))
end

# main_program

clear_screen()
language = retrieve_language()
clear_screen()
name = retrieve_name(language)
welcome(name, language)
sleep(3)

loop do
  scores = { user: 0, computer: 0 }
  display_rules(language)
  reset_scores(scores)
  loop do
    user_choice = retrieve_user_choice(language)
    computer_choice = retrieve_computer_choice()
    clear_screen()
    display_choices(user_choice, computer_choice, language)
    display_result(user_choice, computer_choice, language)
    increment_score(user_choice, computer_choice, scores)
    display_score(scores, name, language)
    break if game_over?(scores)
  end
  clear_screen()
  display_final_winner(scores, language)
  break unless play_again?(language)
end
clear_screen()
goodbye(language)
