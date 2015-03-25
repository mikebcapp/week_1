# Draw board
# Loop
# Prompt player to choose a position
# Player choses a postion
# Check if won / Check any empty postions
# Computer turn
# Check if won / check any empty positions
# End

# Display winner / tie
# Play again

def initialise_board
  board = {}
  (1..9).each{|position| board[position]= " "}
  board
end

def draw_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts
end

def empty_position(board)
  board.select{|position|  board[position] == " "}.keys
end

def player_turn(board)
  begin
    puts "Choose an empty square from 1 to 9"
    position = gets.chomp.to_i 
  end until empty_position(board).include?(position)
  board[position] = "X"
end

def computer_turn(board)
  position = empty_position(board).sample
  board[position] ="O"
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if board[line[0]] == "X" && board[line[1]] == "X" && board[line[2]] == "X"
      return 'Player'
    elsif board[line[0]] == "O" && board[line[1]] == "O" && board[line[2]] == "O"
      return 'Computer'
    end
  end
  nil
end


# def check_winner(board)
#   winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7], [2,5,8],[3,6,9],[1,5,9][3,5,7]]
#   winning_lines.each do |line|
#     if board[line[0]]=="X" &&  board[line[1]]=="X" && board[line[2]]=="X"
#     return "player" 
#     elsif board[line[0]]=="O" &&  board[line[1]]=="O" && board[line[2]]=="O"
#     return "Computer" 
#     end
#   end
#   nil
# end

# def check_winner(board)
#   winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
#   winning_lines.each do |line|
#     return "Player" if board.values_at(*line).count('X') == 3
#     return "Computer" if board.values_at(*line).count('O') == 3
#   end
#   nil
# end

def game_tied?(board)
  empty_position(board) == []
end

board = initialise_board
draw_board(board)

begin
  player_turn(board)
  computer_turn(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || game_tied?(board)
if winner
  puts "#{winner} won"
else
  puts "It's a tie."
end

