class MaintenanceRecord < ActiveRecord::Base
    belongs_to :bike
    validates :name, :date, :cost, :notes, :bike_id, presence: true
end