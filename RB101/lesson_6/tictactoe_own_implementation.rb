=begin
Q: Build a tic-tac-toe (noughts and crosses) game

Mental Model: Tic Tac Toe is a 2 player game played on a 3⨉3 board. Each player takes a turn and marks a square on the board.
              First player to reach 3 squares consecutively, including diagonals, wins. If all 9 squares and marrked and no
              player has 3 squares marked consecutively, then it is a tie.

Algorithm:
1. Display the initial 3⨉3 board 
    - use puts to draw the board
2. Ask the user to mark a square
    - create a 2d nested array, which represents the board. The initial board has all sub array elements initialised to ' '
    - ask user for a square to mark, starting from 1 at the top left and 9 at the bottom right
    - change the given element in the nested array to a nought
    - remove the chosen element from a local variable, available_squares, initialised with elements, 1..9
3. The computer marks a square
    - computer samples available_squares array
    - marks chosen square with cross by changing nested array
4. The board is displayed again
    - puts board
5. If winner, display winner
     - if all rows || columns || diagonals are 'O', user wins
     - elsif all rows || columns ||diagonals are 'X', computer wins
     - else its a tie
6. If tie, display tie 
7. If neither winner nor board is full, go to #2
8. Play again?
9. if yes, go to #1
10. Goodbye!
=end

def display_board(brd)
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

def prompt(message)
  puts ">> #{message}"
end

def intitalise_board_values
  numbers = (1..9).to_a
  numbers.each_with_object({}) do |number, hsh|
    hsh[number] = "#{number}"
  end
end

def retrieve_user_mark(allowed_squares)
  prompt("Which square would you like to mark?")
  square_number = 0
  loop do
    square_number = gets.chomp.to_i
    break if allowed_squares.include?(square_number)
    prompt("Invalid square. Try again.")
  end
  allowed_squares.delete(square_number)
  square_number.to_i
end

def change_square_to_nought(board_values, number)
  board_values[number] = 'O'
end

def change_square_to_cross(board_values, number)
  board_values[number] = 'X'
end

def retrieve_computer_mark(allowed_squares)
  square_number = allowed_squares.sample
  allowed_squares.delete(square_number)
  square_number
end

winning_squares = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                     [1, 4, 7], [2, 5, 8], [3, 6,  9],
                     [1, 5, 9], [3, 5, 7]]

def user_won?(board_values, winning_squares)
  winning_squares.any? do |sub_array|
    sub_array.all? do |square|
      board_values[square] == 'O'
    end
  end
end

def computer_won?(board_values, winning_squares)
  winning_squares.any? do |sub_array|
    sub_array.all? do |square|
      board_values[square] == 'X'
    end
  end
end

def board_full?(remaining_squares)
  remaining_squares.empty?
end

def play_again?
  answer = gets.chomp.downcase
  %w(y yes).include?(answer)
end

loop do 

  board_values = intitalise_board_values()
  display_board(board_values)
  allowed_squares = (1..9).to_a

  loop do

    change_square_to_nought(board_values, retrieve_user_mark(allowed_squares))
    display_board(board_values)

    prompt("The compuuter's move is...")
    sleep(2)

    change_square_to_cross(board_values, retrieve_computer_mark(allowed_squares))
    display_board(board_values)

    if user_won?(board_values, winning_squares)
      prompt("Congratulations. You won!")
      break
    elsif computer_won?(board_values, winning_squares)
      prompt("Bad luck! The computer won.")
      break
    else
      prompt("It's a tie!") if board_full?(allowed_squares)
    end

    break if board_full?(allowed_squares)

  end
  prompt("Do you want to play again?")
  break unless play_again?
end

prompt("Goodbye!")

