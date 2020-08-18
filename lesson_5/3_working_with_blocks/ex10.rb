[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end

=begin
- You have two sub arrays: 
  1st sub array - [[1, 2], [3,4]]
  2nd sub array - [5, 6]
  
  We need to increase the value of each integer by 1
  
  So we first map through the outer array (line 1), and then we map through the sub arrays (line 2)
    - If the sub array is an integer (line 3)
      - add a value of 1 to integer
    - If the sub array is an array (else)
      - map through array
        - For every element in array add 1
    
  The result will be every integer in the array will be increased by one, and the structure will remain
  the same