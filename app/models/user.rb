class User < ActiveRecord::Base
    has_many :bikes
    has_many :maintenance_records, through: :bikes 
    has_secure_password

end

