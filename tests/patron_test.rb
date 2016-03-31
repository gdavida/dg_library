require_relative "test_helper"
require_relative "../lib/patron.rb"

# Patron Model

# name (str) - present
# email (str) - present
# book_id (int) - present

# has_many books

class PatronTest < Minitest::Test

  def test_should_be_creatable_under_normal_circumstances
    p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)
  end
  
#---------------------------------------------------------

  def test_validator_should_fail_with_no_name
    p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)
    assert(p.valid?, "Should be valid at creation")

    p.name = ""
    refute(p.valid?, "Should be invalid with an empty name")

    p.name = nil
    refute(p.valid?, "Should be invalid without a name")
  end

#####

  def test_validator_should_fail_with_no_email
    p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)
    assert(p.valid?, "Should be valid at creation")

    p.email = ""
    refute(p.valid?, "Should be invalid with an empty email")

    p.email = nil
    refute(p.valid?, "Should be invalid without a email")
  end

#####

  def test_validator_should_fail_with_no_book_id
    p = Patron.new(name: "Davida Gaffney", email: "gdavida@gmail.com", book_id: 1)
    assert(p.valid?, "Should be valid at creation")

    p.book_id = ""
    refute(p.valid?, "Should be invalid with an empty book_id")

    p.book_id = nil
    refute(p.valid?, "Should be invalid without a book_id")
  end

#####
end