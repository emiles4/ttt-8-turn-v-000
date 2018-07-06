Skip to content
Features
Business
Explore
Marketplace
Pricing

Search

Sign in or Sign up
1 0 2 alexisadorn/Tic-Tac-Toe-Ruby
 Code  Issues 0  Pull requests 0  Projects 0  Insights
Join GitHub today
GitHub is home to over 28 million developers working together to host and review code, manage projects, and build software together.

Tic-Tac-Toe-Ruby/ttt-8-turn-v-000/lib/turn.rb
8f439e7  on Mar 28, 2017
@alexisadorn alexisadorn Tic Tac Toe labs

60 lines (53 sloc)  1.42 KB
#displays a tic tac toe board, with board spaces passed as an array
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#coverts a user's place on the board to the index integer
def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

#checks the number to see if 1) the position is already taken and 2)it is an actual number
def valid_move?(board, index)
  def position_taken?(array, ind)
    if array[ind] == " " || array[ind] == "" || array[ind] == nil
      return false
    else
      return true
    end
  end

  def on_board?(num)
    if num.between?(0, 8) == true
      return true
    else
      return false
    end
  end

  if (position_taken?(board, index)) == false && (on_board?(index) == true)
    return true
  else
    return false
  end
end

#Takes a users num and the board, and places the X or O char in that position
def move(board, index, character = "X")
  board[index] = character
  return board
end

#Asks user for a number, check if it is valid, and if it's not, recursively continues to ask for a number
def turn (board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
