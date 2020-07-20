def factors(number)
  
  return "Please input a positive integer" if number <= 0

  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

p factors(5)
p factors(60)
p factors(100)
p factors(26)
p factors(44)
p factors(0)
p factors(-1)

=begin
- number % divisor == 0 line is there to only push numbers that are a factor of 5
- line 8 is there to return the factors array after calling method
=end