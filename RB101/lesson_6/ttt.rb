WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = 'O'
SQUARE_FIVE= 5
FIRST_MOVER = 'choose'

def prompt(message)
   puts ">> #{message}"
end

def clear_screen
   system("clear") || system("cls")
end

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

def initialise_board
   (1..9).to_a.each_with_object({}) do |number, hsh|
      hsh[number] = INITIAL_MARKER
   end
end

def joinor(array, delimiter=", ", word="or")
  case array.size
  when 0 then ""
  when 1 then "#{array.first}"
  when 2 then "#{array.first} #{word} #{array.last}"
  else
    *rest, last_number = array
    rest.join(delimiter) + delimiter + word + " " + last_number.to_s
  end
end

def empty_squares(brd)
   brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def retrieve_user_mark(empty_squares, brd)
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

def minimax(current_board, current_player)
  if user_won?(current_board)
    return -10
  elsif computer_won?(current_board)
    return 10
  elsif tie?(current_board)
    return 0
  end

  available_squares = empty_squares(current_board)
  moves = []
  score = nil

  available_squares.each do |available_square|
    move = {}
    current_board[available_square] = COMPUTER_MARKER if current_player == 'computer'
    current_board[available_square] = PLAYER_MARKER if current_player == 'player'
    score = minimax(current_board, alternate_player(current_player))
    current_board[available_square] = INITIAL_MARKER
    move[available_square] = score
    moves.push(move)
  end

  best_move = nil
  best_score = current_player == 'computer' ? -Float::INFINITY : Float:: INFINITY

  if current_player == 'computer'
    moves.each do |hsh|
      hsh.each do |move, score|
        if score > best_score
          best_move = move
          best_score = score
        end
      end
    end
  else
    moves.each do |hsh| 
      hsh.each do |move, score|
        if score < best_score
          best_move = move
          best_score = score
        end
      end
    end
  end
  best_move
end

def retrieve_computer_mark(allowed_squares, board, current_player)
  minimax(board, current_player)
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
    user_places_piece!(board, retrieve_user_mark(empty_squares(board), board))
  else
    computer_places_piece!(board, retrieve_computer_mark(empty_squares(board), board, current_player))
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
  {player: 0, computer: 0}
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
      #binding.pry
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