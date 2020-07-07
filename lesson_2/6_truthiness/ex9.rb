true || 3/0 # This will also not create and error

# This is also another example of 'short-circuiting.' The code after the || operator
# is not being evaluated (or elso we would get a zero division error), 
# since 'true ||' will always be true. 