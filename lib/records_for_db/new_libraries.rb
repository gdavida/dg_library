class Book < ActiveRecord::Base

# branch_name (str) - present / unique
# address (str) - present / unique
# phone (str) - present / unique

end

l = Library.new(branch_name: "Downtown", address: "123 S 4th Street", phone: "555-123-4567")

l = Library.new(branch_name: "East", address: "2400 E. Washington Street", phone: "555-234-5678")

l = Library.new(branch_name: "West", address: "1100 W. Wabash Avenue", phone: "555-345-6789")