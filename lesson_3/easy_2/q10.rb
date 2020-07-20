title = "Flintstones Family Members"

table_width = 40
spaces_to_append = (table_width - title.size) / 2

title.prepend(" " * spaces_to_append).concat(" " * spaces_to_append)
 p title
#or

title.center(40)