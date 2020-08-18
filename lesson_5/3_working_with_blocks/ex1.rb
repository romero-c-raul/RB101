[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

=begin
#each method is being invoked on the array. This array is made up of 2 elements, which are also arrays. 
The block is invoking first on each element in the array, which will result in printing 1 and 3. These two
numbers are the first elements of their respective array. 

Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
-------------------------------------------------------
Line 1:
  1. What is the type of action being performed?
    - Method call #map
  2. What is the object the action is being performed on?
    - Outer array
  3. What is the side effect of that action?
    - Array transformation
  4. What is the return value of that action?
    - transformed calling object
  5. Is Return value used?
    - No but shown on line 6

Line 1-3:
  1. Action:
    - Block execution
  2. Object:
    - Each sub array
  3. Side effect:
    - None
  4. Return Value:
    - nil
  5. Is return value used?
    - No 

Line 2:
  1. Action: 
    - Method call first
  2. Object:
    - Sub array
  3. Side effect:
    - None
  4. Return value:
    - First value within sub array
  5. Is return value used?
    - Yes by #puts

Line 2:
  1. Action:
    - Method call #puts
  2. Object:
    - First value of sub array
  3. Side effect:
    - Prints first value of sub array
  4. Return value:
    - Nil
  5. Is return value used?
    - Yes, used to determine return value of block
=end