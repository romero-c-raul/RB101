my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# [[18, 7], [3, 12]]

=begin
Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
#------------------------------------
Line 1
  1. Action:
    - Variable assignment
  2. Object:
    - N/A
  3. Side effect:
    - None
  4. Return value:
    - [[18, 7], [3. 12]]
  5. Is return value used?
    - No
  
Line 1
  1. Action:
    - Method call #each
  2. Object:
    - Outer array [[18, 7], [3, 12]]
  3. Side effect:
    - None
  4. Return value:
    - Original array method was called on: [[18, 7], [3, 12]]
  5. Is return value used?
    - Yes, used by variable assignment to my_arr

Lines 1 - 7
  1. Action:
    - Outer Block execution
  2. Object:
    - Each Sub array within outer array
  3. Side effect:
    - No
  4. Return value:
    - Each sub array
  5. Is return value used?
    - No

Line 2
  1. Action:
    - Method call #each
  2. Object:
    - Each sub array within outer array
  3. Side effect:
    - None
  4. Return value:
    - Current sub array
  5. Is return value used?
    - Yes, return value of outer block

Lines 2 - 6
  1. Action:
    - Inner block execution
  2. Object:
    - Element of subarray in that iteration
  3. Side effect:
    - None
  4. Return value:
    - Nil if line 4 is executed, and also nil if it isn't
  5. Is return value used?
    - No

Line 3
  1. Action:
    - Comparison
  2. Object:
    - Element of sub array in that iteration
  3. Side effect:
    - None
  4. Return value:
    - Boolean
  5. Is return value used?
    - Yes, evaluated by if. Determines if conditional statement in the following lines is ran

Lines 3 - 5
  1. Action:
    - Conditional statement (if)
  2. Object:
    - Element of sub array in that iteration
  3. Side effect:
    - None
  4. Return value:
    - Nil
  5. Is return value used?
    - Yes, determines return value of inner block
    
Line 4
  1. Action:
    - Method call #puts
  2. Object:
    - Element of sub array in that iteration
  3. Side effect:
    - Outputs string representation of integer
  4. Return value:
    - Nil
  5. Is return value used?
    - Yes, determines return value of inner block

=end