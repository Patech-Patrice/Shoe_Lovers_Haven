class CreateShoeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table  :shoe_entries do |t|
      t.string :name
      t.integer :brand_id
      t.integer :style_id
      t.integer :user_id
      t.timestamps null: false
   end
 end
end
