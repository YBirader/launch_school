=begin
Q: Build a tic-tac-toe (noughts and crosses) game

Mental Model: Tic Tac Toe is a 2 player game played on a 3*3 board.
              Each player takes a turn and marks a square on the board.
              First player to reach 3 squares consecutively, including
              diagonals, wins. If all 9 squares and marrked and no
              player has 3 squares marked consecutively, then it is a tie.

Algorithm:
1. Display the initial empty 3*3 board.
2. Ask the user to mark a square.
3. Computer marks a square
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1.
10. Goodbye!
=end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = " "
SQUARE_FIVE = 5
PLAYER_MARKER = "X"
COMPUTER_MARKER = 'O'
FIRST_MOVER = 'choose'

def prompt(message)
  puts ">> #{message}"
end

def clear_screen
  system("clear") || system("cls")
end

# rubocop:disable Metrics/AbcSize
# rubocop::disable Metrics/MethodLength
def display_board(brd, scores)
  clear_screen
  display_scores(scores)
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "      |      |"
  puts "  #{brd[1]}   | #{brd[2]}    | #{brd[3]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts "  #{brd[4]}   |  #{brd[5]}   | #{brd[6]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts "  #{brd[7]}   |  #{brd[8]}   | #{brd[9]}"
  puts "      |      |"
  puts ""
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

def initialise_board
  (1..9).to_a.each_with_object({}) do |number, hsh|
    hsh[number] = INITIAL_MARKER
  end
end

def joinor(array, delimiter=", ", word="or")
  case array.size
  when 0 then ""
  when 1 then array.first.to_s
  when 2 then "#{array.first} #{word} #{array.last}"
  else
    *rest, last_number = array
    rest.join(delimiter) + delimiter + word + " " + last_number.to_s
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def retrieve_user_mark(empty_squares)
  prompt("Choose a square #{joinor(empty_squares)}:")
  square_number = 0
  loop do
    square_number = gets.chomp.to_i
    break if valid_user_choice?(square_number, empty_squares)
    prompt("Sorry. That's not a valid choice.")
  end
  square_number
end

def valid_user_choice?(choice, empty_squares)
  empty_squares.include?(choice)
end

# rubocop:disable Metrics/MethodLength
def minimax(board, current_player, depth)
  depth += 1
  available_squares = empty_squares(board)
  best_score = current_player == 'computer' ? -Float::INFINITY : Float::INFINITY
  if round_over?(board, available_squares)
    return score(board, available_squares, depth)
  end

  available_squares.each do |available_square|
    new_board = board.clone
    new_board[available_square] = if current_player == 'computer'
                                    COMPUTER_MARKER
                                  else
                                    PLAYER_MARKER
                                  end
    new_board_score = minimax(new_board,
                              alternate_player(current_player),
                              depth)

    if current_player == 'computer' && new_board_score > best_score
      best_score = new_board_score
    elsif current_player == 'player' && new_board_score < best_score
      best_score = new_board_score
    end
  end
  best_score
end

def optimal_move(board, current_player)
  depth = 0
  available_squares = empty_squares(board)
  best_move = nil
  best_score = nil

  available_squares.each do |available_square|
    new_board = board.clone
    new_board[available_square] = if current_player == 'computer'
                                    COMPUTER_MARKER
                                  else
                                    PLAYER_MARKER
                                  end
    score = minimax(new_board, alternate_player(current_player), depth)

    if best_score.nil? || score > best_score
      best_score = score
      best_move = available_square
    end
  end
  best_move
end
# rubocop:enable Metrics/MethodLength

def score(board, available_squares, depth)
  if user_won?(board)
    depth - 10
  elsif computer_won?(board)
    10 - depth
  elsif tie?(available_squares)
    0
  end
end

def retrieve_computer_mark(board, current_player)
  if empty_squares(board).include?(SQUARE_FIVE)
    SQUARE_FIVE
  else
    optimal_move(board, current_player)
  end
end

def user_places_piece!(board, number)
  board[number] = PLAYER_MARKER
end

def computer_places_piece!(board, number)
  prompt("The computer's move is...")
  sleep(1)
  board[number] = COMPUTER_MARKER
end

def place_piece!(board, current_player)
  if current_player == 'player'
    user_places_piece!(board, retrieve_user_mark(empty_squares(board)))
  else
    computer_places_piece!(board, retrieve_computer_mark(board, current_player))
  end
end

def detect_threatened_square(board, marker)
  WINNING_LINES.each do |sub_array|
    marked, threatened = sub_array.partition do |num|
      board[num] == marker
    end
    if marked.size == 2 && board[threatened[0]] == INITIAL_MARKER
      return threatened[0]
    end
  end
  nil
end

def user_won?(board)
  WINNING_LINES.any? do |sub_array|
    sub_array.all? do |num|
      board[num] == PLAYER_MARKER
    end
  end
end

def computer_won?(board)
  WINNING_LINES.any? do |sub_array|
    sub_array.all? do |num|
      board[num] == COMPUTER_MARKER
    end
  end
end

def tie?(empty_squares)
  empty_squares.empty?
end

def play_again?
  prompt("Do you want to play again?")
  answer = ''
  loop do
    answer = gets.chomp
    break if valid_answer?(answer)
    prompt("Invalid response.")
  end
  %w(y yes).include?(answer.downcase)
end

def valid_answer?(answer)
  %w(y yes n no).include?(answer.downcase)
end

def round_over?(board, empty_squares)
  user_won?(board) || computer_won?(board) || tie?(empty_squares)
end

def initialise_scores
  { player: 0, computer: 0 }
end

def display_scores(scores)
  prompt("You: #{scores[:player]} ; Computer: #{scores[:computer]}")
end

def increment_user_score(scores)
  scores[:player] += 1
end

def increment_computer_score(scores)
  scores[:computer] += 1
end

def full_game_over?(scores)
  scores[:player] == 5 || scores[:computer] == 5
end

def user_overall_winner?(scores)
  scores[:player] == 5
end

def set_current_player
  if FIRST_MOVER == 'player'
    'player'
  elsif FIRST_MOVER == 'computer'
    'computer'
  else
    choose_current_player
  end
end

def choose_current_player
  prompt("Who goes first: player or computer?")
  first_mover = ''
  loop do
    first_mover = gets.chomp.downcase
    break if valid_response?(first_mover)
    prompt("Invalid response")
  end
  first_mover
end

def valid_response?(response)
  %w(player computer).include?(response)
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def display_round_result(board, scores)
  if user_won?(board)
    prompt("You won!")
    increment_user_score(scores)
    sleep(1)
  elsif computer_won?(board)
    prompt("The computer won.")
    sleep(1)
    increment_computer_score(scores)
  elsif tie?(empty_squares(board))
    prompt("It's a tie")
    sleep(1)
  end
end

def display_full_game_winner(scores)
  if user_overall_winner?(scores)
    prompt("You are the Grand Winner!")
  else
    prompt("The computer is the grand winner!")
  end
end

loop do
  scores = initialise_scores
  prompt("The first to five wins!")
  loop do
    sleep(1)
    clear_screen
    board = initialise_board
    current_player = set_current_player
    loop do
      display_board(board, scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      display_board(board, scores)
      break if round_over?(board, empty_squares(board))
    end
    display_round_result(board, scores)
    display_board(board, scores)
    break if full_game_over?(scores)
    prompt("Next Round...")
  end
  display_scores(scores)
  display_full_game_winner(scores)

  break unless play_again?
end

clear_screen
prompt("Goodbye! Thanks for playing Tic Tac Toe.")
