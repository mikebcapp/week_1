CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Lets play 'Paper, Rock, Scissors"

def win_message(choice)
  if choice == 'r'
    puts "Rock smashes Scissors"
  elsif choice == 'p'
    puts "Scissors cut paper"
  else puts "Paper wraps rock"
end
begin      
  begin
    puts "Choose either p, r or s to play"
    player_choice = gets.chomp.downcase
    binding.pry
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "Same choice ... its a tie"
  elsif
    (player_choice == 'r' && computer_choice == 's') || (player_choice == 'p' && computer_choice == 'r' )||(player_choice == 's' && computer_choice == 'p')
    puts "You win !!"
    win_message(player_choice)
  else
    puts "Computer wins"
    win_message (computer_choice)
  end
  puts 'Play again (y/n)?'
  play_again = gets.chomp.downcase
end until play_again == "y"

