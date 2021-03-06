class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string 		:title
      t.string 		:author
      t.integer 	:isbn
      t.integer 	:library_id
      t.boolean 	:checked_out
      t.integer		:patron_id
    end
  end
end
