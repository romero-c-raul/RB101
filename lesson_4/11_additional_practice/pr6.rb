# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

new_array = flintstones.map do |name|
  name[0,3]
end

p new_array