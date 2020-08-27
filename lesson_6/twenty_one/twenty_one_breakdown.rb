=begin

1. Initialize deck (52 cards)
  - 4 suits: hearts, diamond, clubs, spades
    - 13 values: 2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace
    - Hash will be used

2. Deal cards to player and dealer
  - Randomly select 2 cards from the deck and give to dealer
  - Randomly select two cards from the deck and give to player
  - Use an array of two elements to represent hands

3. Player turn: hit or stay
  - repeat until bust or "stay"
  - Bust means you went over 21

4. If player bust, dealer wins.

5. Dealer turn: hit or stay
  - repeat until total >= 17

6. If dealer bust, player wins.

7. Compare cards and declare winner.
  - Add value to face cards
  - Create a way to figure out

PSEUDOCODE - Initialize deck
- Initialize an array that contains the 4 suits (card_suits)
- Initialize an array that contains 13 values (card_values)
- Initialize an empty hash (deck)

- Iterate through 4 suits
  - Iterate through card values (each with object)
    - Push each value in card to an array
  - deck[current_suit] = array

  -Return deck

PSEUDOCODE - Dealing cards
- Initialize an empty array (player_hand)
- Initialize an empty array (dealer_hand)

- Pick a random key from deck
  - Initialize a variable current_suit = deck.keys.sample
  - Pick a random value from that key
    - Initialize variable current_value = deck[current_suit].sample
    - Push current_value to player/dealer hand
    - Remove current_value from the deck
      - deck[current_suit].delete(current_value)

  - Repeat twice and until player and dealer have 2 cards each

PSEUDOCODE - Calculate Score
- Accept current_hand
- Initalize variable (total_score) with value 0
- Iterate through player/dealer hand
  - If current value is included in 2..10 (CARD_VALUES[0, 9])
    - total_score += current_value.to_i
  - If current value is included in J, Q, K, A (CARD VALUES[9, 4])
    - If current value is 'A'
      - Use a method to determine value of A and add to total_score
    - If current value is J, Q, or K
      - current_value += 10
- Return total_score
=end