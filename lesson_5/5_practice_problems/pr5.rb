=begin
Figure out the total age of just the male members of the family.

ALGORITHM
- Iterate through hash
  - If the family member is male, add their age to an "age total"
=end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_total = 0

munsters.each do |_, description|
  age_total += description["age"] if description["gender"] == "male"
end