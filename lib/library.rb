# Library Model

# branch_name (str) - present / unique
# address (str) - present / unique
# phone (str) - present / unique
# has_many staff
# has_many books




class Library < ActiveRecord::Base

  has_many :books
 	has_many :patrons
  
	validates :branch_name, presence: true, uniqueness: true
	validates :address, presence: true, uniqueness: true
	validates :phone, presence: true, uniqueness: true

end

##don't know how to test for uniqueness without a test database