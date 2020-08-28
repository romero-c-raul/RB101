CARD_SUITS = %w(Hearts Diamonds Clubs Spades)
CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, punctuation=",", conjunction='and')
  squares_available = []

  if array.size >= 3
    first_to_second_last_numbers = array[0..-2].join("#{punctuation} ")
    last_number = array[-1]
    squares_available << [first_to_second_last_numbers] << last_number
    squares_available.join("#{punctuation} #{conjunction} ")
  elsif array.size == 2
    array.join(" #{conjunction} ")
  else
    array.join
  end
end

def initialize_deck
  deck = {}
  CARD_SUITS.each do |current_suit|
    array = []
    CARD_VALUES.each do |value|
      array << value
    end
    deck[current_suit] = array
  end
  deck
end

def deal_cards(deck)
  current_suit = deck.keys.sample
  current_value = deck[current_suit].sample
  deck[current_suit].delete(current_value)
  current_value
end

def deal_initial_hand(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deal_cards(deck)
    dealer_hand << deal_cards(deck)
  end
end

def calculate_ace_value(total_score)
  total_score + 11 <= 21 ? 11 : 1
end

def calculate_hand_value(current_hand)
  total_score = 0
  current_hand.each do |card|
    if CARD_VALUES[0, 9].include?(card)
      total_score += card.to_i
    elsif CARD_VALUES[9, 4].include?(card)
      total_score += if card == 'A'
                       calculate_ace_value(total_score)
                     else
                       10
                     end
    end
  end
  total_score
end

def display_dealer_hand(dealer_hand)
  shown_card = dealer_hand.sample
  prompt "Dealer has: #{shown_card} and unknown card"
end

def display_player_hand(player_hand)
  cards = joinor(player_hand)
  prompt "You have: #{cards} (for a total of #{calculate_hand_value(player_hand)})"
end

def hit_or_stay?
  acceptable_answers = ['hit', 'stay']
  answer = ''
  loop do
    prompt "Hit or Stay?"
    answer = gets.chomp
    puts ""
    break if acceptable_answers.include?(answer.downcase)
    prompt "Not a valid input. Please try again!"
  end
  
  case answer.downcase
  when "stay"
    prompt "You chose to stay..."
    true
  when "hit"
    false
  end
end

def player_lost_game?(hand_value)
  if hand_value > 21
    puts "--------------------"
    prompt "You lost the game! Your score is over 21."
    true
  else
    false
  end
end

def dealer_lost_game?(hand_value)
  if hand_value > 21
    puts "--------------------"
    prompt "You won the game! Dealer's score is over 21!"
    true
  else
    false
  end
end

def calculate_winner(player_hand, dealer_hand)
  if calculate_hand_value(player_hand) > calculate_hand_value(dealer_hand)
    return 'Player'
  elsif calculate_hand_value(dealer_hand) > calculate_hand_value(player_hand)
    return 'Dealer'
  else
    false
  end
end

def display_winner(winner)
  case winner
  when 'Player'
    puts "--------------------"
    prompt 'You won the game!'
  when 'Dealer'
    puts "--------------------"
    prompt 'You lost the game!'
  when false
    puts "--------------------"
    prompt "It's a tie!"
  end
end 

def anyone_lost?(player_lost, dealer_lost)
  return true if player_lost == true || dealer_lost == true
  false
end

def display_final_score(player_hand, dealer_hand)
  puts ""
  puts "===================================="
  prompt "Player's final hand: #{joinor(player_hand)}"
  prompt "Player's final score: #{calculate_hand_value(player_hand)}"
  prompt ""
  prompt "Dealer's final hand: #{joinor(dealer_hand)}"
  prompt "Dealer's final score: #{calculate_hand_value(dealer_hand)}"
  puts "===================================="
end


def display_welcome_message
  puts "***** Welcome to Twenty-One! *****"
  puts ""
end

def display_instructions
  prompt "The aim of the game is to try and get as close to 21 as possible!"
  prompt "But if you go over 21, you lose immediately. Be careful!"
end

def press_enter_to_continue
  puts ""
  puts "Dealing cards... Press enter to continue."
  gets.chomp
  system 'clear'
end

def play_again?
  answer = ''

  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    acceptable_answers = ['yes', 'no', 'n', 'y']
    puts ""
    break if acceptable_answers.include?(answer)
    prompt "Invalid input. Please try again!"
  end

  answer.start_with?('n') ? true : false
end

def dealer_hit_or_stay?(hand_value)
  if hand_value >= 17
    prompt "Dealer chose to stay..."
    true
  end
end

system 'clear'

display_welcome_message
display_instructions

loop do

  press_enter_to_continue
  
  twenty_one_deck = initialize_deck
  
  player_hand = []
  dealer_hand = []
  
  deal_initial_hand(twenty_one_deck, player_hand, dealer_hand)
  
  display_dealer_hand(dealer_hand)
  display_player_hand(player_hand)
  
  player_lost = nil
  
  # Player turn
  loop do
    break if hit_or_stay?
    
    prompt "You chose to hit!"
    player_hand << deal_cards(twenty_one_deck)
    display_player_hand(player_hand)
    
    player_lost = player_lost_game?(calculate_hand_value(player_hand))
    break if player_lost
  end
  
  dealer_lost = nil
  
  # Dealer turn
  loop do
    break if player_lost
    # break if calculate_hand_value(dealer_hand) >= 17
    break if dealer_hit_or_stay?(calculate_hand_value(dealer_hand))
    dealer_hand << deal_cards(twenty_one_deck)
    prompt "Dealer hits! Dealer's hand is now #{joinor(dealer_hand)}."
    
    dealer_lost = dealer_lost_game?(calculate_hand_value(dealer_hand)) 
  end
  
  # Compare cards if dealer and player stay
  display_winner(calculate_winner(player_hand, dealer_hand)) unless anyone_lost?(player_lost, dealer_lost)
  
  display_final_score(player_hand, dealer_hand)
  
  break if play_again?
end

prompt "Thank you for playing Twenty-One!"

