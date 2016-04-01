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

#### --------------------------------
#####################################
#### SEARCH FOR BOOK BY - SCREEN 1-1 ----
def found_book_title(b)
	puts "\n\nvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
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

  puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
  puts "\nWhat would you like to do with this book?\n"
  puts "\n1 - CHECK IN"
  puts "2 - CHECK OUT"
  puts "3 - EDIT DETAILS"
  puts "\n-------------------\n"
  puts "4 - FIND NEW BOOK"
  puts "5 - DELETE BOOK"
  puts "6 -  ADD NEW BOOK"
  puts "7 -  VIEW ALL BOOKS"
  puts "\nBACK: head back to the main menu"
  choice = gets.chomp.downcase

  #### check in
    #CHOICE VALIDATOR, KEEPS PROMPTING FOR A CORRECT ANSWER IF YOU DIDNT PROVIDE
    while choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "7" && choice != "exit"
       print "Sorry, that's invalid. Try again: "
       choice = gets.chomp.downcase
    end

    #TAKES YOU TO THE APPROPRIATE NEXT SCREEN/MENU BASED ON YOUR # CHOICE
    if choice == "1" #CHECK IN
      if b.checked_out == true 
        b.checked_out = false
        b.save
        found_book_title(b)
      else puts "It is already checked in, please make another choice: "
        choice = gets.chomp.downcase
      end

    elsif choice == "2" #CHECK OUT
      if b.checked_out == false 
        #call check_out method
      else puts "It is already checked out, please make another choice: "
        choice = gets.chomp.downcase
      end
    elsif choice == "3"
      puts "Edit Details"
    elsif choice == "4"
      search_for_book_screen
    elsif choice == "5"
      puts "Delete Book"
    elsif choice == "6"
      add_new_book
    elsif choice == "7"
      puts "VIEW ALL BOOKS"
    elsif choice == "back"
      puts "See ya!"
    end
end

def search_by_title
    # HERES WHAT OUR MENU LOOKS LIKE
  puts "\nWhat is the title of your book?\n"
  print "                      "
  choice = gets.chomp


  #not applicable to this
  # #CHOICE VALIDATOR, KEEPS PROMPTING FOR A CORRECT ANSWER IF YOU DIDNPROVIDE
  # while choice != (1..7) && choice != "back"
  #    print "Sorry, that's invalid. Try again: "
  #    choice = gets.chomp.downcase
  # end

  #SEARCHES FOR BOOK BY TITLE
  b = Book.find_by title: choice
  if b == nil
  	puts "needs to be a method to a new screen that says we cant find that, would you like to add a new book or search again? and then bring to the 1-1 screen"
  	  	################"
  	# didnt_find_book
  else found_book_title(b)
 	end
  

end


#### --------------------------------
#####################################
#### SEARCH FOR BOOK BY - SCREEN 1-1 ----

def search_for_book_screen
  choice = ""

  while choice != "back"
    # HERES WHAT OUR MENU LOOKS LIKE
    puts "\n\vvvvvvvvvvvvvvvvvvvvv"
    puts "vvvvvvvvvvvvvvvvvvvv"
    puts "vvvvvvvvvvvvvvvvvvvv"
    puts "\n\n\nSEARCH FOR BOOK BY"
    puts "-------------------"
    puts "\n1 -  TITLE"
    puts "2 -  AUTHOR"
    puts "3 -  ISBN"
    puts "4 -  PATRON"
    puts "5 -  BRANCH LIBRARY"
    puts "\n-------------------\n"
    puts "6 -  ADD NEW BOOK"
    puts "7 -  VIEW ALL BOOKS"
    puts "\nBACK: head back to the main menu"

	  print "\n\nSelect number: "
	  choice = gets.chomp

	  #CHOICE VALIDATOR, KEEPS PROMPTING FOR A CORRECT ANSWER IF YOU DIDNT PROVIDE
	  while choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "7" && choice != "exit"
	     print "Sorry, that's invalid. Try again: "
	     choice = gets.chomp.downcase
	  end

	  #TAKES YOU TO THE APPROPRIATE NEXT SCREEN/MENU BASED ON YOUR # CHOICE
	  if choice == "1"
	   puts ".............searching by title..."
	   search_by_title
	  elsif choice == "2"
	    puts "Search by AUTHOR"
	  elsif choice == "3"
	    puts "Search by ISBN"
	  elsif choice == "4"
	    puts "Search by PATRON"
	  elsif choice == "5"
	    puts "Search by BRANCH LIBRARY"
	  elsif choice == "6"
	    puts "ADD NEW BOOK"
	  elsif choice == "7"
	    puts "VIEW ALL BOOKS"
	  elsif choice == "back"
	    puts "See ya!"
	  end
  end

	  puts "back to the main menu"
end

  
#### --------------------------------
#####################################
#### MAIN MENU - SCREEN 0 ---------------

def main_menu
  choice = ""

  while choice != "exit"

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

	  while choice != "1" && choice != "2" && choice != "3" && choice != "4" && choice != "exit"
	    print "Sorry, that's not a valid option. Try again: "
	    choice = gets.chomp.downcase
	  end

	  if choice == "1"
	    search_for_book_screen # method call
	    puts "==============going to the Book Menu"
	  elsif choice == "2"
	    search_for_patron_screen # method call
	    puts "==============going to the Patron Menu"
	  elsif choice == "3"
	    search_for_staff_screen # method call
	    puts "==============going to the Staff Menu"
	  elsif choice == "4"
	    search_for_patron_screen # method call
	    puts "==============going to the Library Menu"
	  elsif choice == "exit"
	    puts "You chose to leave"
	  end
  end
end

# this is where our driver actually starts

puts "\n\n\nWelcome to Our Driver Demo!"
main_menu
puts "Goodbye"

binding.pry