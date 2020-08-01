produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'brocolli' => 'Vegetable'
}

empty_hash = {}

def select_fruit(hash)
  produce_collection = hash.keys
  counter = 0
  fruit_collection = {}
  
  loop do
    break if counter == produce_collection.size
    current_produce = produce_collection[counter]
    
    if hash[current_produce] == 'Fruit'
      fruit_collection[current_produce] = 'Fruit'
    end
    
    counter += 1
  end
  fruit_collection
end

puts select_fruit(produce)
puts select_fruit(empty_hash)