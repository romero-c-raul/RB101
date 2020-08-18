[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]

=begin
Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
# -----------------------------------------
Line 1
  1. Action:
    - Method call (#map)
  2. Object:
    - Outer array
  3. Side effect:
    - None
  4. Return value:
    - [[2, 4], 6, 8]], new transformed array
  5. Is return value used?
    - No

Line 1 - 5
  1. Action:
    - Outer block execution
  2. Object:
    - Each sub array within outer array
  3. Side effect:
    - No
  4. Return value:
    - Transformed subarray according to line 3
  5. Is return value used?
    - Yes, return value of block is used by (top level) map to return the new transformed array

Line 2
  1. Action:
    - Method cal (#map)
  2. Object:
    - Each subarray within outer array
  3. Side effect:
    - No
  4. Return value:
    - Transformed sub array according to line 3
  5. Is return value used?
    - Yes, return value is used by outer block execution

Lines 2 - 4
  1. Action:
    - Inner Block execution
  2. Object:
    - Each element within each sub array
  3. Side effect:
    - None
  4. Return value:
    - Transformed element within sub array (integer)
  5. Is return value used?
    - Yes, by #map method call on line 2

Line 3
  1. Action:
    - Multiplication, method cal (*) with integer 2 as an argument
  2. Object:
    - current element of iteration within subarray
  3. Side effect:
    - none
  4. Return value:
    - current element of iteration multiplied by 2 (integer)
  5. Is return value used?
    - Yes, it is used to determine return value by inner block
=end