class CreateStaffTable < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string 		:name
      t.string 		:email
      t.integer   :library_id
    end
  end
end


