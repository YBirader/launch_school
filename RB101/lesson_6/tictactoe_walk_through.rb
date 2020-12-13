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
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(message)
  puts ">> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "      |      |"
  puts " #{brd[1]}    | #{brd[2]}    | #{brd[3]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts " #{brd[4]}    | #{brd[5]}    | #{brd[6]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts " #{brd[7]}    | #{brd[8]}    | #{brd[9]}"
  puts "      |      |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = INITIAL_MARKER
  loop do
    prompt("Choose a square #{empty_squares(brd).join(', ')}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialise_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Goodbye!")


