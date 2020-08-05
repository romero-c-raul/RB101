# What is the block's return value in the following code? 
# How is it determined? Also, what is the return value of #any? 
# in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
- The blocks return value will be a boolean
- The return value of any will be true or false, depending of whether or not any
  of the elements in the array evaluate as true in the last evaluated expression
  in the block
  
- The code will output 1, 2, 3 and return true ----> WRONG
- It seems that the code stops running as soon as an element 
  within the code evaluates as true. So only 1 will print, block will return true,
  and #any will stop
=end

[2, 4, 6, 8, 10, 11].any? do |num|
  puts num
  num.odd?
end