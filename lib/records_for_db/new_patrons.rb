# Patron Model

# name (str) - present
# email (str) - present
# book_id (int)

# has_many books

p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)

p = Patron.new(name: "Lina Gaffney", email: "linamaria@gmail.com", book_id: 4)

p = Patron.new(name: "Sadie McGarvey", email: "sgaff25277@gmail.com", book_id: 3)