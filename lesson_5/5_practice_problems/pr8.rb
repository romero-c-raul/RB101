hsh = { first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |word|
    word.each_char do |letter|
      puts letter if letter =~ /[aeiou]/
    end
  end
end