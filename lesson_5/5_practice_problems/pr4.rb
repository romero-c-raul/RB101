=begin
- For each of these collection objects where the value 3 occurs, 
  demonstrate how you would change this to 4.
  - We need to map through array, and add a value of 1 when the number == 3
    - There are two levels we need to iterate through
=end

arr1 = [1, [2, 3], 4]

arr1.map do |element|
  if element.is_a? Array
    element.map do |number|
      number == 3 ? 4 : number
    end
  else
    element
  end
end
# or arr[1][-1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][-1][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][-1] = 4