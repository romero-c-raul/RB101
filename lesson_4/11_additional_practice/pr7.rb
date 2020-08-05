statement = "The Flintstones Rock"

#First attempt
frequency = Hash.new(0)

statement.chars.each do |char|
  frequency[char] += 1 unless char == " "
end

p frequency
#Answer
result = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

p result == frequency