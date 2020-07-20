=begin

What is the difference between ! and ? in Ruby? And explain what would happen
in the following scenarios:

1. What is != and where should you see it
  - `!=` is a "does not equal" operator, and can be used in conditionals
    for example: print true if x != 5
    
2. put ! before something like, !username
  - Using `!` returns the opposite boolean value of an object
   if the object evaluates as true, then adding `!` before it will return false
     and vice versa

3. put ! after something, like words.uniq!
  - In general, it will not do anything, but certain methods have a `!` sign at the 
  end to indicate that they are mutating methods, but it is not necessary
  
4. put ? before something
  - returns string version of character
    ex. ?a => 'a'

5. put ? after something
  - style convention, usually indicates that the method will return a boolean value
  - can also be used for ternary operations

6. put !! before something, like !!user_name
  - one `!` returns the opposite boolean value of an object, so adding another `!`
    will return the actual boolean value the object evaluates to