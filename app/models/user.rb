class User < ActiveRecord::Base
    has_many :bikes, dependent: :destroy
    has_many :maintenance_records, through: :bikes 
    has_secure_password
    validates :email, uniqueness: true
    
end

