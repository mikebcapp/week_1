CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Lets play 'Paper, Rock, Scissors"

def win_message(choice)
  if choice == 'r'
    puts "Rock smashes Scissors"
  elsif choice == 'p'
    puts "Paper wraps rock"
  else 
    puts "Scissors cut paper"
  end
end

loop do    
  begin
    puts "Choose either p, r or s to play"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "Its a tie, you both chose #{CHOICES[player_choice]}"
  elsif (player_choice == 'r' && computer_choice == 's') ||
        (player_choice == 'p' && computer_choice == 'r' )||
        (player_choice == 's' && computer_choice == 'p')
        puts "You win with #{CHOICES[player_choice]} the computer chose #{CHOICES[computer_choice]}"
        win_message(player_choice)
  else
    puts "The Computer wins with #{CHOICES[computer_choice]}, you chose #{CHOICES[player_choice]}"
    win_message(computer_choice)
  end
  puts 'Play again (y/n)?'
  break if gets.chomp.downcase == "n"
end

