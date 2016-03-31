# Staff Model

# name (str) - present
# email (str) - present / unique
# library_id (int) - present

# belongs_to library

s = Staff.new(name: "Marci", email: "marci@librarymail.com", library_id: 1)

s = Staff.new(name: "Karen", email: "karen@librarymail.com", library_id: 2)

s = Staff.new(name: "Barb", email: "barb@librarymail.com", library_id: 3)