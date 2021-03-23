class CreateBikes < ActiveRecord::Migration[5.0]
    def change
        create_table :bikes do |t|
            t.string :name 
            t.string :description
            t.string :serial_number
            t.string :maintenance_records
            t.integer :user_id
        end
    end
end