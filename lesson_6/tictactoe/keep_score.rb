=begin

PROBLEM:

rules:
    - Keep score of how many times the player and computer each win
    - Do not use global or instance variables
    - First to 5 wins, wins the game

DATA STRUCUTURE
- Strings/Integers

ALGORITHM
- Create a variable to keep track of player wins
- Create another variable to keep track computer wins

- Whenever player wins, add a value of 1 to the player wins tracker
- Whenever computer wins, add a value of 1 to the computer wins tracker

- Stop game when either computer or player get 5 wins

PSEUDOCODE
- Initialize variable player_wins_tracker outside outer loop
- Initialize variable computer_wins_tracker outside outer loop

- Within outer loop (after breaking out of inner loop):
  - If detect winner returns "Player"
    - Increase player_wins_tracker by 1
  - If detect winner returns "Computer"
    - Increase computer_wins_tracker by 1

- Break out of outer loop if player_wins_tracker or computer_wins_tracker is equal
  to 5