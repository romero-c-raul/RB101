[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

=begin
Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
-------------------------------------------------------

Line 1:
  1. Action:
    - Method call map
  2. Object:
    - Outer array
  3. Side effect:
    - None
  4. Return value:
    - New array [nil, nil]
  5. Is return value used?
    - No, but it is shown on line 6

Line 1-3:
  1. Action:
    - Block execution
  2. Object:
    - Each sub array within array
  3. Side effect:
    - None
  4. Return value:
    - Nil
  5. Is return value used?
    - Yes, used by #map for transformation

Line 2:
  1. Action:
    - Method call #first
  2. Object:
    - Sub array
  3. Side effect:
    - None
  4. Return value:
    - Array value on index 0
  5. Is return value used?
    - Yes, by #puts

Line 2:
  1. Action:
    - Method call #puts
  2. Object:
    - each sub array value index 0
  3. Side effect:
    - prints string represenation of integer
  4. Return value:
    -nil
  5. Is return value used?
    - Yes, used to determine return value of block
