# Add up all the ages from the Munster family hash

ages = { 
  "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
  "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 
}

# family_names = ages.keys
# family_ages = ages.values

# sum_ages = 0

# family_ages.each do |age|
#   sum_ages += age
# end

# p sum_ages

ages.select do |key, value|
  value >= 32
end
  
  