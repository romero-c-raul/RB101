=begin
Given this code, what would be the final values of a and b? 
Try to work this out without running the code.
=end

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 
arr[1][0] -= a

=begin
- On line 10, arr[0] is accessing variable a (which is equal to 2)
  - We are adding 2 to the current variable a, which totals 4, so
    a = 4 ------ WRONG
    - Wrong because we were mutating the array, reassigning the first element of the
      array to integer object 4

- On line 10, arr[1][0] is accessing variable b first [5, 8], and then it is
  accessing the first value of variable b, which is 5
  - Then a value of a (which is 4) is being removed from the value of 5,
    and the total will be 1 ----- WRONG, total will be 3 since a variable 
    never changed
    
