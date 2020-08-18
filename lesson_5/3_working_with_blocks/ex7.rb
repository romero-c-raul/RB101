arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

p arr.sort

new_arr = arr.sort_by do |sub_array|
  sub_array.map do |number|
    number.to_i
  end
end
p new_arr