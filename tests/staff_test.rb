require_relative "test_helper"
require_relative "../lib/staff.rb"

# title (str) - present
# author (str) - present
# isbn (int) - present / unique
# library_id (int) - present
# checked_out? (boolean) - present
# patron - present

class StaffTest < Minitest::Test

  def test_should_be_creatable_under_normal_circumstances
    s = Staff.new(name: "Marci", email: "marci@librarymail.com", library_id: 1)
  end
  
#---------------------------------------------------------

  def test_validator_should_fail_with_no_name
    s = Staff.new(name: "Marci", email: "marci@librarymail.com", library_id: 1)
    assert(s.valid?, "Should be valid at creation")

    s.name = ""
    refute(s.valid?, "Should be invalid with an empty name")

    s.name = nil
    refute(s.valid?, "Should be invalid without a name")
  end

#####

  def test_validator_should_fail_with_no_email
    s = Staff.new(name: "Marci", email: "marci@librarymail.com", library_id: 1)
    assert(s.valid?, "Should be valid at creation")

    s.email = ""
    refute(s.valid?, "Should be invalid with an empty email")

    s.email = nil
    refute(s.valid?, "Should be invalid without a email")
  end

#####


  def test_validator_should_fail_with_no_library_id
    s = Staff.new(name: "Marci", email: "marci@librarymail.com", library_id: 1)
    assert(s.valid?, "Should be valid at creation")

    s.library_id = ""
    refute(s.valid?, "Should be invalid with an empty library_id")

    s.library_id = nil
    refute(s.valid?, "Should be invalid without a library_id")
  end

#####

 




end