# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Docs show that take returns a new array, so it is not destructive
# Arr will return the first 2 elements of array