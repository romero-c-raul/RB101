ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# First Method
# Remove people with age 100 and greater, means keep people with age 99 or less 
# (or less than 100)

ages_less_than_hundred = ages.select do |_, value|
  value < 100 
end

p ages_less_than_hundred

#-----------------
# Second Method

ages.delete_if do |key, value|
  value >= 100
end

p ages

