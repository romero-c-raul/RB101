require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num, type = 'float')
  single_digit = %w[0 1 2 3 4 5 6 7 8 9 .]
  single_digit.pop if type == 'integer'

  valid_integer = nil

  num.chars.each do |element|
    valid_integer = single_digit.include?(element) ? true : false
    break if valid_integer == false
  end
  valid_integer
end

prompt MESSAGES['welcome']
prompt MESSAGES['description']
puts ""

loop do
  prompt MESSAGES['loan_amount']
  loan_amount = nil

  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt MESSAGES['error']
    end
  end

  prompt MESSAGES['apr_amount']
  apr = nil

  loop do
    apr = gets.chomp
    if valid_number?(apr)
      apr = apr.to_f
      break
    else
      prompt MESSAGES['error']
    end
  end

  prompt MESSAGES['monthly_term_amount']
  monthly_term = nil

  loop do
    monthly_term = gets.chomp
    if valid_number?(monthly_term, 'integer')
      monthly_term = monthly_term.to_i
      break
    else
      prompt MESSAGES['error']
    end
  end

  monthly_interest = (apr / 12) / 100

  monthly_payments =
    loan_amount * (monthly_interest /
                  (1 - (1 + monthly_interest)**-monthly_term))

  total_paid = monthly_payments * monthly_term
  total_interest = total_paid - loan_amount

  prompt "Your payment every month: $#{monthly_payments.round(2)}"
  prompt "Total of #{monthly_term} payments: $#{total_paid.round(2)}"
  prompt "Total interest: $#{total_interest.round(2)}"
  puts "---------------------------------------------------------------"

  prompt MESSAGES['another_loan?']
  answer = gets.chomp
  break if answer.downcase != 'y'
  puts "---------------------------------------------------------------"
end
