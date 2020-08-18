alphabet = ('a'..'f')
numbers = ('0'..'9')
alpha_num = alphabet.to_a + numbers.to_a

uuid = ''
characters_per_section = [8, 4, 4, 4, 12]

characters_per_section.each do |number|
  number.times do 
    uuid << alpha_num.sample
  end
  uuid << '-'
end

puts uuid[0..-2]