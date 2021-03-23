class User < ActiveRecord::Base
    has_many :bikes
    has_many :maintenance_records, through: :bikes 

end