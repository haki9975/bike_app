class Bike < ActiveRecord::Base
    belongs_to :users
    has_many :maintenance_records

end