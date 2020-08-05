# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# According to the docs, #shift removes a key-value pair from hsh and returns it 
# as the two-item array, does not take any arguments

# Shift will return ['a', 'ant'] ---- CORRECT!