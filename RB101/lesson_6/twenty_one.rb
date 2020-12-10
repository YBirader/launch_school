SUITS = ['C', 'D', 'H', 'S']
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'K', 'Q', 'A']
RANK_VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                '10' => 10, 'J' => 10, 'K' => 10, 'Q' => 10 }
FIRST_MOVER = 'player'
MAX_DEALER_HIT = 17
MAX_SCORE = 21
LARGE_ACE_VALUE = 11
SMALL_ACE_VALUE = 1
NUMBER_OF_ROUNDS = 5

def prompt(message)
  puts message.to_s
end

def display_welcome
  puts <<~MSG
  ====================================================
  Welcome to #{MAX_SCORE}! Get as close to #{MAX_SCORE} without going over.
  (Suits- D: Diamonds, C: Clubs, S: Spades, H: Hearts)
  > Numbers 2-10 are worth their face value
  > The (J)ack, (Q)ueen and (K)ing are each worth 10
  > The A(ce) is worth either 1 or 11
  Player with the total closest to #{MAX_SCORE} wins the round.
  > Any total over #{MAX_SCORE} busts.
  First player to #{NUMBER_OF_ROUNDS} wins the game.
  ========================================================
  MSG
  enter_to_continue
end

def initialise_deck
  SUITS.product(RANKS).shuffle
end

def initialise_hands(deck)
  hands = { player: [], dealer: [] }
  2.times do
    deal!(deck, hands, 'player')
    deal!(deck, hands, 'dealer')
  end
  hands
end

def display_hands(hands)
  prompt("Dealer has: #{hands[:dealer][0][1]} and unknown card")
  player_ranks = hands[:player].each_with_object([]) do |card, ranks|
    ranks << card.last
  end
  prompt "Player has: #{player_ranks.join(', ')} " \
         "with a total of #{total_cards(hands[:player])}"
end

def deal!(deck, hands, current_player)
  hands[current_player.to_sym].push(deck.delete_at(rand(deck.size)))
end

def total_cards(cards)
  total = 0
  cards.each do |card|
    total += if card.last == 'A'
               if total + LARGE_ACE_VALUE <= MAX_SCORE
                 LARGE_ACE_VALUE
               else
                 SMALL_ACE_VALUE
               end
             else
               RANK_VALUES[card.last]
             end
  end
  total
end

def determine_user_choice(current_player, hands)
  if current_player == 'player'
    determine_player_choice
  else
    determine_dealer_choice(hands)
  end
end

def determine_player_choice
  answer = ''
  loop do
    prompt("Do you want to hit or stay?")
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt("That is an invalid answer")
  end
  answer
end

def valid_answer?(answer)
  %w(hit stay h s).include?(answer)
end

def determine_dealer_choice(hands)
  if total_cards(hands[:dealer]) <= MAX_DEALER_HIT
    'hit'
  else
    'stay'
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'dealer' : 'player'
end

def execute_user_choice(current_player, deck, hands, round_counter)
  clear_screen
  loop do
    display_round(round_counter)
    break if busted?(hands)
    display_hands(hands)
    choice = determine_user_choice(current_player, hands)
    clear_screen
    if choice == 'hit' || choice == 'h'
      prompt("#{current_player.capitalize} chose to hit.")
      deal!(deck, hands, current_player)
    else
      prompt("#{current_player.capitalize} stayed")
      break
    end
  end
end

def busted?(hands)
  total_cards(hands[:player]) > MAX_SCORE ||
    total_cards(hands[:dealer]) > MAX_SCORE
end

def display_busted_user(hands, current_player, scores)
  if total_cards(hands[current_player.to_sym]) > MAX_SCORE
    prompt("#{current_player.capitalize} is busted. " \
           "#{alternate_player(current_player).capitalize} wins.")
    increment_score!(scores, alternate_player(current_player))
  end
end

def determine_round_winner(hands, current_player, scores)
  current_hand_score = total_cards(hands[current_player.to_sym])
  alternate_hand_score = total_cards(hands[alternate_player(current_player)
                                     .to_sym])

  if current_hand_score > alternate_hand_score
    prompt("#{current_player.capitalize} wins.")
    increment_score!(scores, current_player)
  elsif current_hand_score < alternate_hand_score
    prompt("#{alternate_player(current_player).capitalize} wins.")
    increment_score!(scores, alternate_player(current_player))
  else
    prompt "It's a tie"
  end
end

def display_score(hands)
  prompt("Player; #{total_cards(hands[:player])}; " \
          "Dealer: #{total_cards(hands[:dealer])}")
end

def play_again?
  response = ''
  loop do
    prompt("Do you want to play again?")
    response = gets.chomp.downcase
    break if valid_response?(response)
    prompt("Invalid response.")
  end
  %w(yes y).include?(response)
end

def valid_response?(response)
  %w(yes y no n).include?(response)
end

def clear_screen
  system('cls') || system('clear')
end

def initialise_scores
  { 'player' => 0, 'dealer' => 0 }
end

def increment_score!(scores, user)
  scores[user] += 1
end

def game_over?(scores)
  scores.values.include?(NUMBER_OF_ROUNDS)
end

def display_scores(scores)
  prompt("Player: #{scores['player']}; Dealer: #{scores['dealer']}")
end

def enter_to_continue
  loop do
    prompt("Please press the enter key to continue")
    action = gets
    break if action == "\n"
    prompt("Invalid key pressed.")
  end
end

def pause_for_next_round
  prompt("Next round...")
  enter_to_continue
end

def display_round(round_counter)
  clear_screen
  prompt("******* Round #{round_counter} ********")
end

def display_grand_winner(current_player, scores)
  clear_screen
  prompt "******* RESULTS *******"
  if scores[current_player] == NUMBER_OF_ROUNDS
    prompt "#{current_player.capitalize} is the grand winner!"
  else
    prompt "#{alternate_player(current_player).capitalize} is the grand winner!"
  end
end

display_welcome

loop do
  scores = initialise_scores
  round = 1
  current_player = ''
  loop do
    deck = initialise_deck
    hands = initialise_hands(deck)
    current_player = FIRST_MOVER
    loop do
      execute_user_choice(current_player, deck, hands, round)
      break if busted?(hands)
      current_player = alternate_player(current_player)
      sleep(1)
      execute_user_choice(current_player, deck, hands, round)
      break
    end
    display_score(hands)

    if busted?(hands)
      display_busted_user(hands, current_player, scores)
    else
      determine_round_winner(hands, current_player, scores)
    end
    display_scores(scores)
    break if game_over?(scores)
    pause_for_next_round
    round += 1
  end
  sleep(1)
  display_grand_winner(current_player, scores)
  break unless play_again?
end
clear_screen
prompt("Thank you for playing twenty-one!")
