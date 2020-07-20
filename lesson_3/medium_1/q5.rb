limit = 15

def fib(first_num, second_num, limit) #Need to pass limit as an argument so it can be accessed inside the methods scope
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit) 
puts "result is #{result}"