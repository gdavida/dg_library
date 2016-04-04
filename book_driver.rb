# Show
# New / Create
# Edit / Update
# Destroy

# main menu
# - sub-menus



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
  Book.all
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

