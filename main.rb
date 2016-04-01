require_relative "config/environment.rb"
require_relative "lib/library.rb"
require_relative "lib/staff.rb"
require_relative "lib/book.rb"
require_relative "lib/patron.rb"
require 'active_support/inflector'
require "active_record"
require "pry"
require "yaml"

#####################################
#### SEARCH FOR BOOK BY - SCREEN 1-1 ----
def search_for_book_screen

puts "\n\n\nvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
puts "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
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

puts "X -  EXIT"
end

#### --------------------------------
#### MAIN MENU - SCREEN 0 ---------------


puts "\n\nLIBRARY MAIN MENU"
puts "-------------------"
puts "\n1 -  FIND BOOK"
puts "2 -  FIND PATRON"
puts "3 -  FIND STAFF"
puts "4 -  FIND LIBRARY"
puts "\n-------------------\n"
puts "X -  EXIT"

print "Select number: "
main_choice = gets.chomp
if main_choice == "1"
	search_for_book_screen
	
end

#### ------------------------------------



















binding.pry
