[{a: 'ant', b: 'elephant'}, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => 'cat'}]

=begin
Line(s)
  1. Action:
  2. Object:
  3. Side effect:
  4. Return value:
  5. Is return value used?
#--------------------------------------------------------
Line 1 
  1. Action:
    - Method call (#select)
  2. Object:
    - Outer array
  3. Side effect:
    - None
  4. Return value:
    - [{ :c => 'cat'}]
  5. Is return value used?
    - No

Line 1 - 5
  1. Action:
    - Outer block execution
  2. Object:
    - Each hash within outer array
  3. Side effect:
    - None
  4. Return value:
    - Boolean
  5. Is return value used?
    - Yes by #select

Line 2
  1. Action:
    - Method call (#all?)
  2. Object:
    - Each hash within outer array
  3. Side effect:
    - None
  4. Return value:
    - Boolean
  5. Is return value used?
    - Yes, it determines the return value of the outer block execution

Lines 2 - 4
  1. Action:
    - Inner block execution
  2. Object:
    - Each key-value pair within hash
  3. Side effect:
    - None
  4. Return value:
    - Boolean
  5. Is return value used?
    - Yes, by #all

Line 3
  1. Action:
    - Method call #to_s
  2. Object:
    - key on current iteration
  3. Side effect:
    - None
  4. Return value:
    - String representation of key
  5. Is return value used?
    - Yes by #==
    
Line 3
  1. Action:
    - Method call #[]=
  2. Object:
    - Value on current iteration
  3. Side effect:
    - None
  4. Return value:
    - Character on index[0] of value
  5. Is return value used?
    - Yes by #= method

Line 3
  1. Action:
    - Method call #==
  2. Object:
    - First character on value
  3. Side effect:
    - None
  4. Return value:
    - Boolean
  5. Is return value used?
    - Yes, to determine return of inner block execution

If #any? is used, then select would return both hashes, since #any would evaluate both hashes to true.
=end