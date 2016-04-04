require_relative "config/environment.rb"
require_relative "lib/library.rb"
require_relative "lib/staff.rb"
require_relative "lib/book.rb"
require_relative "lib/patron.rb"
require 'active_support/inflector'
require "active_record"
require "pry"
require "yaml"

# require statements

# Index
# Show
# New / Create
# Edit / Update
# Destroy

# main menu
# - sub-menus

# Show
# New / Create
# Edit / Update
# Destroy

# main menu
# - sub-menus


def delete_book(b)
  print "Are you sure you want to delete this book?"
    answer = gets.chomp
    if answer == "y*"
      b.destroy
    else found_it(record)
    end
end



#------------------------------
# Prompts with questions for user to add new book to book database
# 
#



def add_new_patron
  p = Patron.new
  print "Name: "
  p.name = gets.chomp
  print "Email: "
  p.email = gets.chomp

  p.isbn = gets.chomp

  p.save
  found_it(record)
end

def add_new_book
  b = Book.new
  print "Title: "
  b.title = gets.chomp
  print "Author: "
  b.author = gets.chomp
  print "ISBN: "
  b.isbn = gets.chomp
  print "Home Library ID: "
  b.library_id = gets.chomp
  print "Checked-out?: "
  b.checked_out = gets.chomp
  print "Patron Name: "
  b.patron_id = gets.chomp
  b.save
  found_it(record)
end


#------------------------------
# type in patron name to see if they exist in patron database and if they do then get their id number, if they dont you can add them or search for a different patron
# 
#
def search_patron
  print "Name of patron checking out book?"
  p = gets.chomp
  patron = p.find_by(name: p)

  if patron == nil 
    puts "That patron does not exits."
    puts "(1) Add New Patron"
    puts "(2) Search Patron again"
    print "Please select way to proceed: "
    choice = gets.chomp
    if choice == "1"
      add_new_patron 
    elsif choice == "2"
      search_patron
    end
  else
    checked_out_by = patron.id
    b.update(checked_out:true, patron_id: checked_out_by)
  end
end


#------------------------------
# Updates checked_out to FALSE and sets patron_id to 00 (the circulation desk)
# 
#
def check_in(b)
  if b.checked_out == false
    puts "It is already checked in, please make another choice: \n"
    found_it(b)
  else
    b.update(checked_out: false, patron_id: 00)
  end
end

#------------------------------
# Updates checked_out to TRUE and finds out patron_id to associate the book with whoever is checking it out
# 
#
def check_out(b)
  if b.checked_out == false
    search_patron
  else puts "It is already checked in, please make another choice: "
    choice = gets.chomp.downcase
  end
end


#### --------------------------------
# 
# 
def view_all_books
  list_of_books = Book.all
  list_of_books.map {|b|
    puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
    puts "#{b.title} by #{b.author}"
    puts "ISBN: #{b.isbn}"
    puts "Home Branch: #{b.library.branch_name}"
    puts "Checked out?: #{b.checked_out}"
  }
  find_book_by_menu
end

#### --------------------------------
#
#
def cannot_find_isbn
  puts "That ISBN does not exits."
  puts "(1) Add New Book"
  puts "(2) Search For ISBN Again"
  print "Please select way to proceed: "
  choice = gets.chomp
  
  if choice == "1"
    add_new_book 
  elsif choice == "2"
    search_by_isbn
  end
end


def cannot_find_author
  puts "That author does not exits."
  puts "(1) Add New Book"
  puts "(2) Search For Author Again"
  print "Please select way to proceed: "
  choice = gets.chomp
  
  if choice == "1"
    add_new_book 
  elsif choice == "2"
    search_by_author
  end
end


def cannot_find_title
  puts "That title does not exits."
  puts "(1) Add New Book"
  puts "(2) Search For Title Again"
  print "Please select way to proceed: "
  choice = gets.chomp
  if choice == "1"
    add_new_book 
  elsif choice == "2"
    search_by_title
  end
end


#### --------------------------------
#
#
def found_it(b)
  puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
  puts "#{b.title} by #{b.author}"
  puts "ISBN: #{b.isbn}"
  puts "Home Branch: #{b.library.branch_name}"
    #instead of: Library.find(b.library_id).branch_name}
    # client = Client.find(10)
  if b.checked_out == true
    puts "Checked out to #{Patron.find(b.patron_id).name}"
  else
    puts "CHECKED IN"
  end
end




#### --------------------------------
#
#
def search_by_isbn
    # HERES WHAT OUR MENU LOOKS LIKE
  puts "\nWhat is the ISBN number of your book, please only include the 10-digit ISBN?\n"
  print "    ISBN -- "
  choice = gets.chomp
  #SEARCHES FOR BOOK BY AUTHOR
  b = Book.find_by isbn: choice
    if b == nil
      cannot_find_isbn
    else found_it(record)
      record_summary_menu(b)
    end
end


def search_by_author
    # HERES WHAT OUR MENU LOOKS LIKE
  puts "\nWho is the author of your book?\n"
  print "    Author -- "
  choice = gets.chomp
  #SEARCHES FOR BOOK BY AUTHOR
  b = Book.find_by author: choice
    if b == nil
      cannot_find_author
    else found_it(record)
      record_summary_menu(b)
    end
end


def search_by_title
    # HERES WHAT OUR MENU LOOKS LIKE
  puts "\nWhat is the title of your book?\n"
  print "    Title -- "
  choice = gets.chomp
  #SEARCHES FOR BOOK BY TITLE
  b = Book.find_by title: choice
    if b == nil
      cannot_find_title
    else found_it(b)
      record_summary_menu(b)
    end

end



#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#### --------------------------------
# 
# 
# 
def book_edit_menu(b)
    puts "vvvvvvvvvvvvvvvvvvvv"
    puts "EDIT BOOK DETAILS"
    puts "-------------------"
    puts "Which part of the book do you want to edit?"
    puts "\n1 -  TITLE"
    puts "2 -  AUTHOR"
    puts "3 -  ISBN"
    puts "4 -  HOME BRANCH LIBRARY"
    puts "5 -  DONE EDITING"
    puts "\n-------------------\n"
    choice = gets.chomp

    if choice == "1"
      print "Title-- "
      new_title = gets.chomp
      b.update(title: new_title)
      found_it(b)
      record_summary_menu(b)
    elsif choice == "2"
      print "Author-- "
      new_author = gets.chomp
      b.update(author: new_author)
      found_it(b)
      record_summary_menu(b)
    elsif choice == "3"
      print "ISBN-- "
      new_isbn = gets.chomp
      b.update(isbn: new_isbn)
      found_it(b)
      record_summary_menu(b)
    elsif choice == "4"
      print "Library ID-- "
      new_library_id = gets.chomp
      b.update(library_id: new_library_id)
      found_it(b)
      record_summary_menu(b)
    elsif choice == "5"
      puts "See ya!"
      found_it(b)
      record_summary_menu(b)
    else print "Sorry, that's invalid. Try again: "
      book_edit_menu(b)
    end
end


#### --------------------------------
#
#
def record_summary_menu(b)
  puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
  puts "What would you like to do with this book?\n"
  puts "\n1 - CHECK IN"
  puts "2 - CHECK OUT"
  puts "3 - EDIT DETAILS"
  puts "\n-------------------\n"
  puts "4 - FIND NEW BOOK"
  puts "5 - DELETE BOOK"
  puts "6 -  ADD NEW BOOK"
  puts "7 -  VIEW ALL BOOKS"
  puts "\n\nMAIN: head back to the main menu"
  choice = gets.chomp.downcase

    if choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "7" && choice != "main"
       print "Sorry, that's invalid. Try again: "
       choice = gets.chomp.downcase
    elsif choice == "1" #CHECK IN
      check_in(b) # +
    elsif choice == "2" #CHECK OUT
      check_out(b) # +
    elsif choice == "3"
      book_edit_menu(b) # +
    elsif choice == "4"
      find_book_by_menu # +
    elsif choice == "5"
      delete_book # +
    elsif choice == "6"
      add_new_book # +
    elsif choice == "7"
      view_all_books # +
    elsif choice == "main"
      main_menu
    end
end


#### --------------------------------
#
#

def find_book_by_menu
    puts "vvvvvvvvvvvvvvvvvvvvv"
    puts "vvvvvvvvvvvvvvvvvvvv"
    puts "\nSEARCH FOR BOOK BY"
    puts "-------------------"
    puts "\n1 -  TITLE"
    puts "2 -  AUTHOR"
    puts "3 -  ISBN"
    puts "\n-------------------\n"
    puts "4 -  ADD NEW BOOK"
    puts "5 -  VIEW ALL BOOKS"
    puts "\nMAIN: head back to the main menu\n\n"
    print "\n\nSelect number: "
    choice = gets.chomp.downcase

    if choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "5" && choice != "exit"
       print "Sorry, that's invalid. Try again: "
       choice = gets.chomp.downcase
    elsif choice == "1" # +
     puts ".............searching by title..."
     search_by_title
    elsif choice == "2" # +
      puts "Search by AUTHOR"
    elsif choice == "3" # +
      puts "Search by ISBN"
    elsif choice == "4" 
      add_new_book # +
    elsif choice == "5"
      view_all_books
    elsif choice == "main"
      main_menu
      puts "back to the main menu"
    end
end


#### --------------------------------
#
#

def main_menu
    puts "\nLIBRARY MAIN MENU"
    puts "-------------------"
    puts "\n1 -  FIND BOOK"
    puts "2 -  FIND PATRON"
    puts "3 -  FIND STAFF"
    puts "4 -  FIND LIBRARY"
    puts "\n-------------------\n"
    puts "EXIT -  EXIT PROGRAM"
    print "Select number: "
    choice = gets.chomp.downcase

    if choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "exit"
      print "Sorry, that's not a valid option. Try again: "
      main_menu
    elsif choice == "1" # +
      puts "==============going to the Book Menu"
      find_book_by_menu # method call 
    elsif choice == "2"
      puts "==============going to the Patron Menu"
      find_patron_by # method call
    elsif choice == "3"
      puts "==============going to the Staff Menu"
      find_staff_by # method call
    elsif choice == "4"
      puts "==============going to the Library Menu"
      find_library_by # method call
    elsif choice == "exit"
      puts "You chose to leave"
    end
end

# this is where our driver actually starts

puts "\n\n\nWelcome to The Library!"
main_menu


binding.pry