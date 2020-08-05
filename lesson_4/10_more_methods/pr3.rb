[1, 2, 3].reject do |num|
  puts num
end

# What is the return value of reject in the following code? Why?
# According to docs#reject returns an array for which the given block evaluates 
# as no true (false?)

# The block returns 'nil' which is a falsey value, so I am thinking that the
# original array will be returned  ------> Correct!
