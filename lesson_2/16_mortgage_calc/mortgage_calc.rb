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

prompt "-----Welcome to Amortized Loan Calculator!-----"
prompt "Use this calculator for basic calculations of common loan types"
puts ""

loop do
  prompt "What is the loan amount?"
  loan_amount = nil

  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt "Enter positive number. Please try again"
    end
  end

  prompt "What is the APR (percentage)?"
  apr = nil

  loop do
    apr = gets.chomp
    if valid_number?(apr)
      apr = apr.to_f
      break
    else
      prompt "Enter positive number. Please try again"
    end
  end

  prompt "Indicate loan term (in months)"
  monthly_term = nil

  loop do
    monthly_term = gets.chomp
    if valid_number?(monthly_term, 'integer')
      monthly_term = monthly_term.to_i
      break
    else
      prompt "Enter positive number (no decimals). Please try again"
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

  prompt "Would you like to calculate another loan? (Y/N)"
  answer = gets.chomp
  break if answer.downcase != 'y'
  puts "---------------------------------------------------------------"
end

prompt('Goodbye!')
