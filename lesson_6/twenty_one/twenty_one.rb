require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

CARD_SUITS = %w(Hearts Diamonds Clubs Spades)
CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

WHATEVER_ONE = 21 # Increase in increments of 10 from 21
DEALER_LIMIT = WHATEVER_ONE - 4
WINNING_ROUNDS = 5

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
  total_score + 11 <= WHATEVER_ONE ? 11 : 1
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
  prompt "You have: #{cards} (total of #{calculate_hand_value(player_hand)})"
end

def validate_answer
  acceptable_answers = ['hit', 'stay']
  answer = ''
  loop do
    prompt MESSAGES['hit_or_stay?']
    answer = gets.chomp
    puts ""
    break if acceptable_answers.include?(answer.downcase)
    prompt MESSAGES['invalid_input']
  end
  answer
end

def hit_or_stay?
  answer = validate_answer

  case answer.downcase
  when "stay"
    prompt MESSAGES['player_chose_stay']
    true
  when "hit"
    false
  end
end

def player_lost_game?(hand_value)
  if hand_value > WHATEVER_ONE
    puts "--------------------"
    prompt MESSAGES['busted_player_message'] + " " + "#{WHATEVER_ONE}."
    true
  else
    false
  end
end

def dealer_lost_game?(hand_value)
  if hand_value > WHATEVER_ONE
    puts "--------------------"
    prompt MESSAGES['busted_dealer_message'] + " " + "#{WHATEVER_ONE}!"
    true
  else
    false
  end
end

def calculate_winner(player_hand, dealer_hand)
  if player_hand > dealer_hand
    'Player'
  elsif dealer_hand > player_hand
    'Dealer'
  else
    false
  end
end

def display_winner(winner)
  case winner
  when 'Player'
    puts MESSAGES['divider']
    prompt MESSAGES['player_won_round']
  when 'Dealer'
    puts MESSAGES['divider']
    prompt MESSAGES['player_lost_round']
  when false
    puts MESSAGES['divider']
    prompt MESSAGES['tie_round']
  end
end

def anyone_lost?(player_lost, dealer_lost)
  return true if player_lost == true || dealer_lost == true
  false
end

# rubocop:disable Metrics/AbcSize
def display_final_score(player_hand, dealer_hand)
  total_player_score = calculate_hand_value(player_hand)
  total_dealer_score = calculate_hand_value(dealer_hand)
  puts ""
  puts MESSAGES['scoreboard_divider']
  prompt MESSAGES['player_final_hand'] + (joinor(player_hand)).to_s
  prompt MESSAGES['player_final_score'] + total_player_score.to_s
  prompt ""
  prompt MESSAGES['dealer_final_hand'] + (joinor(dealer_hand)).to_s
  prompt MESSAGES['dealer_final_score'] + total_dealer_score.to_s
  puts MESSAGES['scoreboard_divider']
end
# rubocop: enable Metrics/AbcSize

def display_welcome_message
  puts MESSAGES['welcome_message']
  puts ""
end

def display_instructions
  prompt "Try to get as close to #{WHATEVER_ONE} as possible!"
  prompt "But if you go over #{WHATEVER_ONE}, you lose immediately. Be careful!"
  prompt "First to win #{WINNING_ROUNDS} rounds wins the game."
  puts ""
end

def press_enter_to_continue
  puts MESSAGES['press_enter_to_continue']
  gets.chomp
  system 'clear'
end

def play_again?
  answer = ''

  loop do
    prompt MESSAGES['play_again?']
    answer = gets.chomp.downcase
    acceptable_answers = ['yes', 'no', 'n', 'y']
    puts ""
    break if acceptable_answers.include?(answer)
    prompt MESSAGES['invalid_input']
  end

  answer.start_with?('n') ? true : false
end

def dealer_hit_or_stay?(hand_value)
  if hand_value >= DEALER_LIMIT
    prompt MESSAGES['dealer_chose_stay']
    true
  end
end

def update_game_score(winner, wins_tracker)
  if winner == 'Player'
    wins_tracker[:player_wins] += 1
  elsif winner == 'Dealer'
    wins_tracker[:dealer_wins] += 1
  end
end

def next_round_start?(wins_tracker)
  if wins_tracker[:player_wins] < WINNING_ROUNDS &&
     wins_tracker[:dealer_wins] < WINNING_ROUNDS
    puts ""
    puts MESSAGES['next_round_coming']
    true
  else
    false
  end
end

def also_update_game_score(wins_tracker, player_lost, dealer_lost)
  if anyone_lost?(player_lost, dealer_lost)
    if player_lost == true
      wins_tracker[:dealer_wins] += 1
    elsif dealer_lost == true
      wins_tracker[:player_wins] += 1
    end
  end
end

def display_scoreboard(wins_tracker)
  player_score = wins_tracker[:player_wins]
  dealer_score = wins_tracker[:dealer_wins]
  prompt "Rounds won: Player - #{player_score}; Dealer - #{dealer_score}"
end

def determine_game_winner(wins_tracker)
  return 'Player' if wins_tracker[:player_wins] >= WINNING_ROUNDS
  return 'Dealer' if wins_tracker[:dealer_wins] >= WINNING_ROUNDS
end

def display_game_winner(wins_tracker)
  winner = determine_game_winner(wins_tracker)
  case winner
  when 'Player'
    puts ""
    prompt MESSAGES['player_grand_winner']
  when 'Dealer'
    puts ""
    prompt MESSAGES['lost_tournament']
  end
end

def display_player_hits
  prompt "You chose to hit!"
end

def display_dealer_hits(dealer_hand)
  prompt "Dealer hits! Dealer's hand is now #{joinor(dealer_hand)}."
end

system 'clear'

display_welcome_message
display_instructions

loop do
  wins_tracker = { player_wins: 0,
                   dealer_wins: 0 }

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

      display_player_hits
      player_hand << deal_cards(twenty_one_deck)
      display_player_hand(player_hand)

      player_lost = player_lost_game?(calculate_hand_value(player_hand))
      break if player_lost
    end

    dealer_lost = nil

    # Dealer turn
    loop do
      break if player_lost
      break if dealer_hit_or_stay?(calculate_hand_value(dealer_hand))
      dealer_hand << deal_cards(twenty_one_deck)
      display_dealer_hits(dealer_hand)

      dealer_lost = dealer_lost_game?(calculate_hand_value(dealer_hand))
      break if dealer_lost
    end

    someone_busted = anyone_lost?(player_lost, dealer_lost)
    final_player_score = calculate_hand_value(player_hand)
    final_dealer_score = calculate_hand_value(dealer_hand)

    # Compare cards if dealer and player stay
    winner = calculate_winner(final_player_score, final_dealer_score)
    display_winner(winner) unless someone_busted
    display_final_score(player_hand, dealer_hand)

    # If both players stayed, this will update the overall game score
    update_game_score(winner, wins_tracker) unless someone_busted
    # If someone busted, this will update the over game score instead
    also_update_game_score(wins_tracker, player_lost, dealer_lost)

    display_scoreboard(wins_tracker)

    break unless next_round_start?(wins_tracker)
  end

  display_game_winner(wins_tracker)
  break if play_again?
end

prompt MESSAGES['goodbye_message']
