some_method_call = 1 # Example of method call being true
puts 'its true!' if some_method_call

# When using method calls as a conditional expression in this way, 
# you'll generally want the method to return a boolean rather than relying on 
# the truthiness or falsyness of a non-boolean return value.

# This means that the some_method call output should be either true or false, 
# not a truthy or falsey value
