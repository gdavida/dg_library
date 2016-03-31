class RenameLibraryIdToBookId < ActiveRecord::Migration
  def change
    rename_column :patrons, :library_id, :book_id
  end
end
