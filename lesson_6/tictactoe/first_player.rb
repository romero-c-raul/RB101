=begin
- Can you change the game so that the computer moves first? Can you make this a setting at 
  the top (i.e. a constant), so that you could play the game with either player or computer 
  going first? Can you make it so that if the constant is set to "choose", then your game will 
  prompt the user to determine who goes first? 
  Valid options for the constant can be "player", "computer", or "choose".
  
PROBLEM
rules:
    - Explicit Rules:
      - Modify program so it includes a constant that determines which player goes first.
        - There should be three options: PLAYER, COMPUTER, CHOOSE
      - Player should be prompted at the start of the game who should go first if "CHOOSE" 
        is the value of the constant

ALGORITHM:
- If the value of the constant is equal to choose
  - Player will be prompted to choose who goes first
- If the value of the constant is equal to player (or player is chosen)
  - Player goes first, computer goes second (current setup)
- If the value of the constant is equal to computer (or computer is chosen)
  - Computer goes first, player goes second
