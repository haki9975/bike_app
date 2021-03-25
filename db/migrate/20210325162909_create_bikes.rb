class CreateBikes < ActiveRecord::Migration[5.2]
    def change
      create_table :bikes do |t|
        t.string :name 
        t.string :description
        t.string :serial_number
        t.integer :user_id
      end

   end
end
