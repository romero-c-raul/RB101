[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]


=begin
Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
------------------------------------------
Lines 1
  1. Action:
    - Method call map
  2. Object:
    - Array
  3. Side effect:
    - None
  4. Return value:
    - New array [1, 3]
  5. Is return value used?
    - No, but it is shown on line 7

Line 1 - 4
  1. Action:
    - Block execution
  2. Object:
    - Sub array
  3. Side effect:
    - None
  4. Return value:
    - First element within sub array
  5. Is return value used?
    - Yes, by map

Line 2
  1. Action:
    - Method call first
  2. Object:
    - sub array
  3. Side effect:
    - None
  4. Return value:
    - First element of sub array
  5. Is return value used?
    - Yes, by puts

Line 2
  1. Action:
    - Method call puts
  2. Object:
    - First element in sub array
  3. Side effect:
    - Prints first value of sub array
  4. Return value:
    - Nil
  5. Is return value used?
    - No
    
Line 3
  1. Action:
    - Method call first
  2. Object:
    - Sub array
  3. Side effect:
    - None
  4. Return value:
    - First element within sub-array
  5. Is return value used?
    - Yes, it determines the return value of the block
=end