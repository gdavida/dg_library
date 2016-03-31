require_relative "test_helper"
require_relative "../lib/library.rb"
# Library Model

# branch name (str) - present / unique
# address (str) - present / unique
# phone (str) - present / unique
# has_many books
# has_many staff

class LibraryTest < Minitest::Test

  def test_should_be_creatable_under_normal_circumstances
    l = Library.new(branch_name: "Downtown", address: "123 S 4th Street", phone: "555-123-4567")
    refute_nil(l)
  end
  
#---------------------------------------------------------

  def test_validator_should_fail_with_no_branch_name
    l = Library.new(branch_name: "Downtown", address: "123 S 4th Street", phone: "555-123-4567")
    assert(l.valid?, "Should be valid at creation")

    l.branch_name = ""
    refute(l.valid?, "Should be invalid with an empty branch_name")

    l.branch_name = nil
    refute(l.valid?, "Should be invalid without a branch_name")
  end

#####

  def test_validator_should_fail_with_no_address
    l = Library.new(branch_name: "Downtown", address: "123 S 4th Street", phone: "555-123-4567")
    assert(l.valid?, "Should be valid at creation")

    l.address = ""
    refute(l.valid?, "Should be invalid with an empty address")

    l.address = nil
    refute(l.valid?, "Should be invalid without a address")
  end

#####

  def test_validator_should_fail_with_phone
    l = Library.new(branch_name: "Downtown", address: "123 S 4th Street", phone: "555-123-4567")
    assert(l.valid?, "Should be valid at creation")

    l.phone = ""
    refute(l.valid?, "Should be invalid with an empty phone")

    l.phone = nil
    refute(l.valid?, "Should be invalid without a phone")
  end

#####


end