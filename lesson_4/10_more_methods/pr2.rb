['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# How does count treat the block's return value? How can we find out?
# #count counts the number of elements for which the block returns true
# In this case, we want to know how many elements have a length less than 4
# and there are two elements that will evaluate to true

# The return value will be two