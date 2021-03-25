class RemoveColumnFromBikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :bikes, :maintenance_records_id
  end
end
