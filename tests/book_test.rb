require_relative "test_helper"
require_relative "../lib/book.rb"

# title (str) - present
# author (str) - present
# isbn (int) - present / unique
# library_id (int) - present
# checked_out? (boolean) - present
# patron - present

class BookTest < Minitest::Test

  def test_should_be_creatable_under_normal_circumstances
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    refute_nil(b)
  end
  
#---------------------------------------------------------

  def test_validator_should_fail_with_no_title
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.title = ""
    refute(b.valid?, "Should be invalid with an empty title")

    b.title = nil
    refute(b.valid?, "Should be invalid without a title")
  end

#####

  def test_validator_should_fail_with_no_author
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.author = ""
    refute(b.valid?, "Should be invalid with an empty author")

    b.author = nil
    refute(b.valid?, "Should be invalid without a author")
  end

#####

  def test_validator_should_fail_with_no_isbn
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.isbn = ""
    refute(b.valid?, "Should be invalid with an empty isbn")

    b.isbn = nil
    refute(b.valid?, "Should be invalid without a isbn")
    #test integers only
    b.isbn = "abc123123123"
    refute(b.valid?, "Should be invalid with anything other than integers")
  end

#####

  def test_validator_should_fail_with_no_library_id
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.library_id = ""
    refute(b.valid?, "Should be invalid with an empty library_id")

    b.library_id = nil
    refute(b.valid?, "Should be invalid without a library_id")

    b.library_id = "abc"
    refute(b.valid?, "Should be invalid with anything other than integers")
  end

#####

  def test_validator_should_fail_with_no_checked_out
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.checked_out = ""
    refute(b.valid?, "Should be invalid with an empty checked_out")

    b.checked_out = nil
    refute(b.valid?, "Should be invalid without a checked_out")
  end

#####

  def test_validator_should_fail_with_no_patron
    b = Book.new(title: "Pride and Prejudice", author: "Jane Austen", isbn: 1503290563, library_id: 1, checked_out: true, patron_id: 1)
    assert(b.valid?, "Should be valid at creation")

    b.patron_id = ""
    refute(b.valid?, "Should be invalid with an empty patron_id")

    b.patron_id = nil
    refute(b.valid?, "Should be invalid without a patron_id")

    b.patron_id = "abc"
    refute(b.valid?, "Should be invalid with anything other than integers")
  end

#####






end