def titleize(string)
  string.split(" ").map(&:capitalize).join(" ")
end

words = "the flintstones rock"

p titleize(words)

# (string.split(" ").map do |words|
#   words.capitalize
# end).join(" ")
