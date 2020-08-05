# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  value if value.size > 3
end

# My guess is an array with value 'bear' will be returned ----> WRONG
  # returned value was [nil, 'bear']

#When none of the conditions on an if statement evaluates to true, nil will be returned,
# thats why we have nil as our first value in the array