# rubocop:disable Layout/LineLength Layout/LeadingCommentSpace
=begin
If we run the current game, we'll see the following prompt:

=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9
This is ok, but we'd like for this message to read a little better. We want to separate the last item with a "or", so that it reads:

=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
Currently, we're using the Array#join method, which can only insert a delimiter between the array elements, and isn't smart enough to display a joining word for the last element.

Write a method called joinor that will produce the following result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Then, use this method in the TTT game when prompting the user to mark a square.

PROBLEM
  - Input:
    1st: array
    2nd: string (what joins the first - second to last elements in array)
    3rd string (what joins the last two elements in the array)
  - Output: string

rules:
    - Explicit Rules:
      - Need to join every element within array with a ", " (or what is indicated in 2nd argument)
        EXCEPT the last two elements
        - Last two elements need to be joined with a ", or" (or what is indicated in 3rd argument)

    - Implicit rules:
      - Two elements in array should be joined with " or " (no commas or anything)

DATA STRUCTURE
- Array

ALGORITHM
- Array is given as an input
- Punctuation is given as an optional input
- and/or usage is given as optional input

- Determine the number of elements within array:
  - If number of elements in array is greater than 2
    - Join first to second to last elements with ", " (or given optional argument)
    - Join the elements that were previously joined with the last element in
      the array with ", or" (or given optional argument)
  - If number of elements in array is equal to 2
    - Join elements with just " or " (or given optional argument)
  - Else
    - No need tp join

PSEUDOCODE
- Accept array as an input (array)
- Punctuation is an optional parameter
  - Default parameter is a comma (punctuation=",")
- Conjunction is an optional parameter
  - Default parameter is word "or" (conjunction="or")
- Initialize empty array (squares_available)

- If number of elements in array >= 3
  - first_to_second_last_numbers = join first element in array to second-to-last element with
    "punctuation "
  - Push first_to_second_last_numbers into squares_available as an array
  - Push last element of input array into squares_available
  - Join squares available with " conjunction "
- If number of elements in array == 2
  - Join elements within input array with " conjunction "
- Else
  - Join single number
=end
# rubocop:enable Layout/LineLength Layout/LeadingCommentSpace

def joinor(array, punctuation=",", conjunction='or')
  squares_available = []

  if array.size >= 3
    first_to_second_last_numbers = array[0..-2].join("#{punctuation} ")
    last_number = array[-1]
    squares_available << [first_to_second_last_numbers] << last_number
    squares_available.join("#{punctuation} #{conjunction} ")
  elsif array.size == 2
    array.join(" #{conjunction} ")
  else
    array.join
  end
end

p joinor([1, 2, 3])
p joinor([1, 2])
p joinor([1, 2, 3], ';')
p joinor([1, 2, 3], ',', 'and')
