# Patron Model

# name (str) - present
# email (str) - present
# book_id (int)

# has_many books

p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)

s = Patron.new(name: "Karen", email: "karen@librarymail.com", library_id: 2)

s = Patron.new(name: "Barb", email: "barb@librarymail.com", library_id: 3)