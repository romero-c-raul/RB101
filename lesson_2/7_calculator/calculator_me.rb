# frozen_string_literal: true

def calculator
  puts 'Input first number (integer): '
  integer_one = gets.chomp
  puts 'Input second number (integer) : '
  integer_two = gets.chomp
  puts 'What operation would you like to perform?
       (add, subtract, multiply, divide)'
  operation = gets.chomp

  case operation
  when 'add'
    puts integer_one.to_i + integer_two.to_i
  when 'subtract'
    puts integer_one.to_i - integer_two.to_i
  when 'multiply'
    puts integer_one.to_i * integer_two.to_i
  when 'divide'
    puts integer_two.to_f == 0 ? 'Cannot divide by zero!' : integer_one.to_f / integer_two.to_f
  else
    puts 'Please select appropriate operation'
    end
end

calculator
