# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
- The first iteration will return 1
- The second iteration will print 2 and return nil
- The third iteration will print 3 and return nil

- 2, 3 will print
- Array returned will be [1, nil, nil]
