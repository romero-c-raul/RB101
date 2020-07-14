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
GAME_WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def welcome_message
  puts ""
  puts MESSAGES['welcome']
  puts MESSAGES['winning_rules']
  puts ""
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

def update_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
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
  puts ""
end

def display_grand_winner(player_counter, computer_counter)
  if player_counter == GAME_WINNING_SCORE
    prompt MESSAGES['player_grandwinner_message']
  elsif computer_counter == GAME_WINNING_SCORE
    prompt MESSAGES['computer_grandwinner_message']
  end
end

def game_over_condition(player_counter, computer_counter)
  player_counter == GAME_WINNING_SCORE || computer_counter == GAME_WINNING_SCORE
end

def answer_is_yes?(input)
  input.downcase().start_with?('y')
end

def clear_terminal
  system("clear")
  puts MESSAGES['game_header']
end

def display_goodbye
  prompt MESSAGES['goodbye_message']
end

def reset_score(score)
  score[:player] = 0
  score[:computer] = 0
  clear_terminal
end

def start_next_round
  puts "Press Enter to start next round"
  gets.chomp
  clear_terminal
end

def obtain_player_input
  choice = ''
  acceptable_key = ''

  loop do
    prompt MESSAGES['key_input_choices']
    choice = gets.chomp.downcase
    acceptable_key = convert_choice_to_key(choice)

    if WINNING_MOVES.keys.include?(acceptable_key)
      return acceptable_key
    else
      prompt MESSAGES['validation_error']
    end
  end
end

def display_round_counter(counter)
  puts "This is round ##{counter}!"
end

welcome_message

score = { player: 0, computer: 0 }
round_counter = 1

loop do
  display_round_counter(round_counter)

  acceptable_key = obtain_player_input
  computer_choice = WINNING_MOVES.keys.sample

  display_choices(acceptable_key, computer_choice)
  determine_winner = display_winner(acceptable_key, computer_choice)
  prompt determine_winner

  update_score(acceptable_key, computer_choice, score)
  display_score(score[:player], score[:computer])
  display_grand_winner(score[:player], score[:computer])

  if score[:player] == GAME_WINNING_SCORE ||
     score[:computer] == GAME_WINNING_SCORE
    answer = play_again?
    break unless answer_is_yes?(answer)
    reset_score(score)
    round_counter = 1
    next
  end

  round_counter += 1

  start_next_round
end

display_goodbye
