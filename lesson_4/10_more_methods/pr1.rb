[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# What is the return value of the select method below? Why?
# This will return [1, 2, 3] since it will always return a true value -----> Correct!