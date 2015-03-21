#Show Board
#Player makes first move
#Computer checks empty spaces and makes move
#Check if won, if not repeat

require 'pry'

def initialise_board
  board={}
  (1..9).each {|i | board[i] = " "}
  board
end

def draw_board(board)
  system 'clear'
  puts"  #{board[1]} | #{board[2]}  | #{board[3]}  "
  puts"-----------"
  puts"  #{board[4]} | #{board[5]}  | #{board[6]} "
  puts"----------"
  puts"  #{board[7]} |#{board[8]}   |  #{board[9]} "
end

def empty_postions(board)
  board.select {|k, v| v=""}.keys
end

def player_go(board)
  puts "Player pick a square 1 .. 9"
  position = gets.chomp.to_i
  board[position]= "X"
end

def computer_go(board)
  position = empty_postions(board).sample
  board[position] = "O"
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if board[line[0]]== "X" && board[line[1]] == "X" && board[line[2]]== "X"
      return 'Player'
    elsif board[line[0]] == "O" && board[line[1]]== "O" && board[line[2]]== "O"
      return 'Computer'
    else
     return nil
    end
  end
end


board = initialise_board
draw_board(board)

begin
  player_go(board)
  computer_go(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_postions(board).empty?

if winner
  puts "#{winner} won"
else
  puts "Its a tie"
end
  