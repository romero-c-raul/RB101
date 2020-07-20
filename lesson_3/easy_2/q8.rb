advice = "Few things in life are as important as house training your pet dinosaur."

house_index = advice.index("house")

advice.slice!(0...house_index)
advice

# using #slice wont mutate advice