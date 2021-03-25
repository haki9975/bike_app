class ChangeMaintenanceRecords < ActiveRecord::Migration[5.2]
  def change
    change_table :maintenance_records do |t|
      t.remove :user_id
      t.remove :bike_id
    end
  end
end
