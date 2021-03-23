class CreateMaintenanceRecords < ActiveRecord::Migration[5.0]
    def change
        create_table :maintenance_records do |t|
            t.string :name
            t.string :date
            t.integer :cost
            t.string :notes
            t.integer :bike_id
        end
    end
end
