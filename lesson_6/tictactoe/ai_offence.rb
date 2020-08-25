=begin
- If the computer already has 2 in a row, then fill in the 3rd square, 
  as opposed to moving at random.
  
  should be opposite of defensive_mode
=end
def offensive_mode(brd)
  WINNING_LINES.shuffle.each do |line|
    if brd[line[0]] == COMPUTER_MARKER && brd[line[1]] == COMPUTER_MARKER
      return brd[line[2]] = COMPUTER_MARKER if brd[line[2]] == INITIAL_MARKER
      next
    elsif brd[line[1]] == COMPUTER_MARKER && brd[line[2]] == COMPUTER_MARKER
      return brd[line[0]] = COMPUTER_MARKER if brd[line[0]] == INITIAL_MARKER
      next
    elsif brd[line[0]] == COMPUTER_MARKER && brd[line[2]] == COMPUTER_MARKER
      return brd[line[1]] = COMPUTER_MARKER if brd[line[1]] == INITIAL_MARKER
      next
    end
  end
  nil
end