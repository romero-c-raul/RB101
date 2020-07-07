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