require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def welcome_message
  puts ""
  prompt MESSAGES['welcome']
  prompt MESSAGES['description']
  puts ""
end

def valid_number?(num, type = 'float')
  single_digit = %w[0 1 2 3 4 5 6 7 8 9 .]
  single_digit.pop if type == 'integer'

  valid_integer = nil
  integer_array = []

  num.chars.map do |element|
    valid_integer = single_digit.include?(element)
    integer_array.push(element) if valid_integer == true
    break if valid_integer == false
  end
  valid_integer = false if integer_array.count(".") > 1
  valid_integer
end

def retrieve_loan_amount
  prompt MESSAGES['loan_amount']
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      return loan_amount unless loan_amount == 0
      prompt MESSAGES['non_zero_error']
    else
      prompt MESSAGES['error']
    end
  end
end

def retrieve_apr_amount
  prompt MESSAGES['apr_amount']
  loop do
    apr = gets.chomp
    if valid_number?(apr)
      apr = apr.to_f
      return apr
    else
      prompt MESSAGES['error']
    end
  end
end

def retrieve_duration
  prompt MESSAGES['monthly_term_amount']
  loop do
    monthly_term = gets.chomp
    if valid_number?(monthly_term, 'integer')
      monthly_term = monthly_term.to_i
      return monthly_term unless monthly_term == 0
      prompt MESSAGES['non_zero_error']
    else
      prompt MESSAGES['no_decimals_or_zero_error']
    end
  end
end

def calculate_monthly_interest(apr)
  (apr / 12) / 100
end

def calculate_monthly_payments(loan_amount, monthly_interest, monthly_term)
  if monthly_interest != 0
    loan_amount * (monthly_interest /
                    (1 - (1 + monthly_interest)**-monthly_term))
  else
    loan_amount / monthly_term
  end
end

def calculate_total_paid(monthly_payments, monthly_term)
  monthly_payments * monthly_term
end

def calculate_total_interest(total_paid, loan_amount)
  total_paid - loan_amount
end

def display_loan_information(monthly_payments,
                             total_paid,
                             monthly_term,
                             total_interest)
  prompt "Your payment every month: $#{monthly_payments.round(2)}"
  prompt "Total of #{monthly_term} payments: $#{total_paid.round(2)}"
  prompt "Total interest: $#{total_interest.round(2)}"
  puts "---------------------------------------------------------------"
end

def retrieve_new_calculation_answer
  prompt MESSAGES['another_loan?']
  acceptable_answers = ['y', 'n', 'yes', 'no']

  loop do
    answer = gets.chomp.downcase
    if acceptable_answers.include?(answer)
      return answer
    else
      puts MESSAGES['answer_error']
    end
  end
end

def play_again?(answer)
  if answer.start_with?('y')
    true
  else
    false
  end
end

def display_goodbye
  prompt('Goodbye!')
  puts ""
end

def clear_terminal
  system("clear")
  puts "---------------------------------------------------------------"
end

welcome_message

loop do
  loan_amount = retrieve_loan_amount
  apr = retrieve_apr_amount
  monthly_term = retrieve_duration
  monthly_interest = calculate_monthly_interest(apr)

  monthly_payments =
    calculate_monthly_payments(loan_amount, monthly_interest, monthly_term)
  total_paid = calculate_total_paid(monthly_payments, monthly_term)
  total_interest = calculate_total_interest(total_paid, loan_amount)

  display_loan_information(monthly_payments,
                           total_paid,
                           monthly_term,
                           total_interest)
  answer = retrieve_new_calculation_answer
  break unless play_again?(answer)

  clear_terminal
end
display_goodbye
