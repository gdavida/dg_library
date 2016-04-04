class Book < ActiveRecord::Base
# title (str) - present
# author (str) - present
# isbn (int) - present / unique
# library_id (int) - present
# checked_out? (boolean) - present
# patron - present
# belongs_to library
# belongs_to patron

end

b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: "1503290563", library_id: 1, checked_out: true, patron_id: 1)

b = Book.new(title: "Persuasion", author: "Jane Austen", isbn: "0486295559", library_id: 3, checked_out: true, patron_id: 3)

b = Book.new(title: "Mansfield Park", author: "Jane Austen", isbn: "0141439807", library_id: 2, checked_out: true, patron_id: 1)

b = Book.new(title: "Emma", author: "Jane Austen", isbn: "0141439580", library_id: 3, checked_out: true, patron_id: 2)

b = Book.new(title: "Northanger Abbey", author: "Jane Austen", isbn: "0141439793", library_id: 1, checked_out: true, patron_id: 3)