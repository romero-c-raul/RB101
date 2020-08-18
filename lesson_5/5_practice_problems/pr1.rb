=begin
How would you order this array of number strings by descending numeric value?
  - You need to sort according to the integer value, so block parameter of sort must
    be converted to integer

=end

arr = ['10', '11', '9', '7', '8']
arr.sort { |a, b| b.to_i <=> a.to_i }