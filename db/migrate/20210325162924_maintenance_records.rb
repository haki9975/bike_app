class MaintenanceRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenance_records do |t|
      t.string :name
      t.string :date
      t.integer :cost
      t.string :notes
      t.integer :bike_id
      t.integer :user_id
    end
  end
end
