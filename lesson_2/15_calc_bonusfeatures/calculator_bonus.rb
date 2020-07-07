require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  single_digit = %w[0 1 2 3 4 5 6 7 8 9 .]
  valid_integer = nil
  
  num.chars.each do |element|
    valid_integer = single_digit.include?(element) ? true : false
    break if valid_integer == false
  end
  valid_integer
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt messages('welcome', 'es')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt messages('valid_name', 'es')
  else
    break
  end
end

prompt "Hi #{name}"

loop do # main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"
  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the calculator. Goodbye!"

# File was refactored using rubocop