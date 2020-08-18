hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}



object = hsh.each_with_object([]) do |(produce, descriptors), array|
  array << descriptors[:colors].map(&:capitalize) if descriptors[:type] == 'fruit'
  array << descriptors[:size].upcase if descriptors[:type] == 'vegetable'
end

p object