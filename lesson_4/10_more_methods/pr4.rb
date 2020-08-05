# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

=begin
- In this case, we are passing a hash as an argument to each_with_object,
  and our value are the elements of the array
- What our method will return will be a new hash with the values 'a' => ant, 'b' => bear,
  'c' => 'cat' ----- CORRECT!