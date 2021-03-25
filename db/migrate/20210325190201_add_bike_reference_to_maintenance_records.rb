class AddBikeReferenceToMaintenanceRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :maintenance_records, :bike, foreign_key: true
  end
end
