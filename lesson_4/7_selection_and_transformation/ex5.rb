def multiply(numbers, integer)
  counter = 0
  
  loop do
    break if counter == numbers.size
    numbers[counter] *= integer
    
    counter += 1
  end
  
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)