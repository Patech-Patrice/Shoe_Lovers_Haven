class CreateShoeEntries < ActiveRecord::Migration
  def change
    create_table  :shoe_entries do |t|
      t.string :name
      t.string :brand
      t.string :style
      t.integer :user_id
      t.timestamps null: false
   end
 end
end
