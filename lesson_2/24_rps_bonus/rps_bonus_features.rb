require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_features_messages.yml')

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
  puts MESSAGES['welcome']
end

def convert_choice_to_key(input)
  if input != 's'
    ACCEPTABLE_INPUTS[input]
  else
    letter_s_choice = ''
    loop do
      prompt MESSAGES["s_input_options"]
      letter_s_choice = gets.chomp
      break if letter_s_choice == '0' || letter_s_choice == '1'
      prompt MESSAGES["s_input_error"]
    end
    ACCEPTABLE_INPUTS[input][letter_s_choice.to_i]
  end
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_winner(player, computer)
  if win?(player, computer)
    MESSAGES['player_winning_message']
  elsif win?(computer, player)
    MESSAGES['computer_winning_message']
  else
    MESSAGES['tie_message']
  end
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def play_again?
  prompt MESSAGES['play_again?_message']
  acceptable_answers = ['y', 'n', 'yes', 'no']
  loop do
    answer = gets.chomp.downcase
    if acceptable_answers.include?(answer)
      return answer
    else
      prompt MESSAGES['play_again?_error']
    end
  end
end

def display_score(player_counter, computer_counter)
  prompt MESSAGES["score_title"]
  prompt("Player: #{player_counter} | Computer: #{computer_counter}")
  prompt MESSAGES["divider"]
end

def display_grand_winner(player_counter, computer_counter)
  if player_counter == 5
    prompt MESSAGES['player_grandwinner_message']
  elsif computer_counter == 5
    prompt MESSAGES['computer_grandwinner_message']
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
  puts MESSAGES['game_header']
end

def increase_counter_player(winning_message)
  winning_message == MESSAGES['player_winning_message'] ? 1 : 0
end

def increase_counter_computer(winning_message)
  winning_message == MESSAGES['computer_winning_message'] ? 1 : 0
end

def display_goodbye
  prompt MESSAGES['goodbye_message']
end

welcome_message

player_win_counter = 0
computer_win_counter = 0

loop do
  choice = ''
  acceptable_key = ''

  loop do
    prompt MESSAGES['key_input_choices']
    choice = gets.chomp.downcase
    acceptable_key = convert_choice_to_key(choice)

    if WINNING_MOVES.keys.include?(acceptable_key)
      break
    else
      prompt MESSAGES['validation_error']
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

display_goodbye
