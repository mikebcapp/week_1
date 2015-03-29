def calculate_total (cards)
  values = cards.collect { |card| card[1] }
  total = 0   
  values.each do | value |
    if value == "Ace"
      total += 11
    elsif
      value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  aces = cards.select { |card | card[1] == "Ace" }.count
  while aces > 0
    total -= 10 if total > 21
    aces -= 1
  end
  total
end

puts"Welcome to Blackjack!"

#Set up deck
suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
deck = suits.product(cards)
deck.shuffle!

player_hand = []
dealer_hand = []
player_total = 0
dealer_total = 0

2.times do
player_hand << deck.pop
dealer_hand << deck.pop
end

player_total = calculate_total(player_hand)
dealer_total = calculate_total(dealer_hand)

puts "Player has been dealt #{player_hand[0]} and #{player_hand[1]} for a total of #{player_total}"
puts "Dealer has been dealt #{dealer_hand[0]} and #{dealer_hand[1]} for a total 0f #{dealer_total}"
puts

#Player turn
begin
  puts "Choose 1) to Hit or 2) to stay"
  hit_stay = gets.chomp
  if hit_stay == "1"
    player_hand << deck.pop
    player_total = calculate_total(player_hand)
    puts "You received a #{player_hand.last} and your total is now #{player_total}"
    player_bust = player_total > 21
    player_bust ?  break : next
  else hit_stay =="2"
    puts"Your total is #{player_total}"
  end
end while hit_stay == "1" 
puts player_bust  ?  "You Bust, Dealer wins" : "You Stayed"
  
#Dealer turn
unless player_bust || dealer_total > 16
  begin
    dealer_hand << deck.pop
    dealer_total = calculate_total(dealer_hand)
    puts "The dealer received a #{dealer_hand.last} to total #{dealer_total}"
  end while dealer_total < 17
  dealer_bust = dealer_total > 21
  puts dealer_bust ? "Dealer Bust!  You win with #{player_total}" : "Dealer stayed with #{dealer_total}"
end

#Determine winner
unless player_bust || dealer_bust
  begin
    if player_total > dealer_total
      puts "Player wins with a score of #{player_total} compared to #{dealer_total}"
    elsif dealer_total > player_total
       puts "Dealer wins with a score of #{dealer_total} compared to #{player_total}"
    else 
      puts "Its a tie with a score of #{player_total}"
    end
  end
end
