WINNING_MOVES = { "rock" => %w[scissors lizard],
                  "paper" => %w[rock spock],
                  "scissors" => %w[paper lizard],
                  "lizard" => %w[paper spock],
                  "spock" => %w[scissors rock] }
ACCEPTABLE_INPUTS = { "r" => "rock",
                      "p" => "paper",
                      "s" => ["scissors", "spock"],
                      "l" => "lizard" }

def prompt(message)
  puts "=> #{message}"
end

def welcome_message
  puts ""
  puts "****** Welcome to Rock, Paper, Scissors, Lizard, Spock! ******"
end

def convert_choice_to_key(input)
  if input != 's'
    ACCEPTABLE_INPUTS[input]
  else
    letter_s_choice = ''
    loop do
      prompt("Input 0 for scissors or 1 for spock")
      letter_s_choice = gets.chomp
      break if letter_s_choice == '0' || letter_s_choice == '1'
      prompt("Invalid input, please try again.")
    end
    ACCEPTABLE_INPUTS[input][letter_s_choice.to_i]
  end
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_winner(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
    'Computer won!'
  else
    "It's a tie!"
  end
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def play_again?
  prompt('Do you want to play again? (Yes/No)')
  acceptable_answers = ['y', 'n', 'yes', 'no']
  loop do
    answer = gets.chomp.downcase
    if acceptable_answers.include?(answer)
      return answer
    else
      prompt("Invalid input, please try again.")
    end
  end
end

def display_score(player_counter, computer_counter)
  prompt("----------- Score -----------")
  prompt("Player: #{player_counter} | Computer: #{computer_counter}")
  prompt("-----------------------------")
end

def display_grand_winner(player_counter, computer_counter)
  if player_counter == 5
    prompt("You are the grand winner! Game is over!")
  elsif computer_counter == 5
    prompt("The Computer is the grand winner! :( ")
  end
end

def game_over_condition(player_counter, computer_counter)
  player_counter == 5 || computer_counter == 5
end

def answer_is_yes?(input)
  input.downcase().start_with?('y')
end

def clear_terminal
  system("clear")
  puts " ****** Rock, Paper, Scissors, Lizard, Spock! ****** "
end

def increase_counter_player(winning_message)
  winning_message == "You won!" ? 1 : 0
end

def increase_counter_computer(winning_message)
  winning_message == "Computer won!" ? 1 : 0
end

welcome_message

player_win_counter = 0
computer_win_counter = 0

loop do
  choice = ''
  acceptable_key = ''

  loop do
    prompt("Choose one: r - rock, p - paper, s - scissors or spock, l - lizard")
    choice = gets.chomp.downcase
    acceptable_key = convert_choice_to_key(choice)
    
    if WINNING_MOVES.keys.include?(acceptable_key)
      break
    else
      prompt("That is not a valid choice, try again")
    end
  end

  computer_choice = WINNING_MOVES.keys.sample

  display_choices(acceptable_key, computer_choice)
  determine_winner = display_winner(acceptable_key, computer_choice)
  prompt determine_winner

  player_win_counter += increase_counter_player(determine_winner)
  computer_win_counter += increase_counter_computer(determine_winner)

  display_score(player_win_counter, computer_win_counter)
  display_grand_winner(player_win_counter, computer_win_counter)
  break if game_over_condition(player_win_counter, computer_win_counter)

  answer = play_again?
  break unless answer_is_yes?(answer)
  clear_terminal
end

prompt('Thank you for playing. Goodbye!')
