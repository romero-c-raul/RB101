=begin
- The computer currently picks a square at random. That's not very interesting.
  Let's make the computer defensive minded, so that if there's an immediate threat,
  then it will defend the 3rd square. We'll consider an "immediate threat" to be 2
  squares marked by the opponent in a row. If there's no immediate threat, then it will
  just pick a random square.
=end
  # old method:

  def computer_places_piece!(brd)
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end

=begin

ALGORITHM
- Go through every winning line within the board
- If there is a player marker in the first 2 elements of that line:
  - Add computer marker to the 3rd element
- If there is a player marker in the last 2 elements of that line:
  - Add computer marker to first element
=end

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize_board
    new_board = {}
    (1..9).each { |num| new_board[num] = 'X' }
    new_board
  end

  def computer_places_piece!(brd)
    # defensive move
    WINNING_LINES.shuffle.each do |line|
      if brd[line[0]] && brd[line[1]] == 'X'
        brd[line[2]] = 'O'
        break
      elsif brd[line[1]] && brd[line[2]] == 'X'
        brd[line[0]] = 'O'
        break
      else
        square = empty_squares(brd).sample
        brd[square] = 'O'
      end
    end
  end

  p board = initialize_board
  computer_places_piece!(board)
  p board
