require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
WINNING_ROUNDS = 5

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice. "
  end
  brd[square] = PLAYER_MARKER
end

# def computer_places_piece!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

def computer_places_piece!(brd)
  # Defensive move
  WINNING_LINES.shuffle.each do |line|
    if (brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER)
      return brd[line[2]] = COMPUTER_MARKER if brd[line[2]] == INITIAL_MARKER
      next
    elsif (brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER)
      return brd[line[0]] = COMPUTER_MARKER if brd[line[0]] == INITIAL_MARKER
      next
    end
  end
  
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |square| brd[square] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |square| brd[square] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

def display_winner(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won this round!"
  else
    prompt "Is a tie!"
  end
end

def joinor(array, punctuation=",", conjunction='or')
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

def update_wins_tracker(winner_detection, wins_tracker)
  case winner_detection
  when 'Player'
    wins_tracker[:player_wins] += 1
  when 'Computer'
    wins_tracker[:computer_wins] += 1
  end
end

def display_scores(wins_tracker)
  prompt "Player score: #{wins_tracker[:player_wins]}"
  prompt "Computer score: #{wins_tracker[:computer_wins]}"
end

def game_won?(wins_tracker)
  if wins_tracker[:player_wins] >= WINNING_ROUNDS || 
     wins_tracker[:computer_wins] >= WINNING_ROUNDS
    return true
  end
end

def determine_game_winner(wins_tracker)
  return 'Player' if wins_tracker[:player_wins] >= WINNING_ROUNDS
  return 'Computer' if wins_tracker[:computer_wins] >= WINNING_ROUNDS
end

def announce_game_winner(game_winner)
  prompt("--------------------")
  prompt("#{game_winner} won the game!")
end

wins_tracker = { player_wins: 0,
                 computer_wins: 0
}

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  display_winner(board)
  update_wins_tracker(detect_winner(board), wins_tracker)
  display_scores(wins_tracker)
  
  break if game_won?(wins_tracker)

  prompt "Press enter to start next round!"
  gets.chomp
end

winner = determine_game_winner(wins_tracker)
announce_game_winner(winner)

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
