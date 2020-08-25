=begin

ALGORITHM - place_piece!

- Takes in 2 arguments (board, current player)
- Establish a case for current player
  - When the case is 'Player'
    - run the player places piece program
  - When the case is 'Computer'
    - run the computer places piece program

ALGORITHM - alternate_player(current_player)
- Take in one argument (current player)
- Establish a case for current player
  - When case is 'Player'
    - return 'Computer'
  - When case is 'Computer'
    - return 'Player'