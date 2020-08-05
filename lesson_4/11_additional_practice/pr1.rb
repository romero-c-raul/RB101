flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]

hsh = {}

flintstones.each_with_index do |name, index|
  hsh[name] = index
end

p hsh

------------------------------------

flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]
index_value = 0

flintstones_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = index_value
  index_value += 1
end

p flintstones_hash

=begin
- First method allows us to iterate through an array, and have two block arguments
  representing the names and index values
- Second method allows us to iterate through an array and have two block arguments
  representing the names and the object we want to push our objects into, which in this
  case is a hash