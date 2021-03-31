class Bike < ActiveRecord::Base
   belongs_to :user
   has_many :maintenance_records, dependent: :destroy
   validates :name, :description, :serial_number, :user_id, presence: true
 # class all method
    # class first method
    # class find/find_by/where (select)
    # save instance
    # update instance method
    # create instance (new/save together)
    # destroy instance method
    # destroy_all class method
    # destroy_by class method
    # attr_accessors for all columns

    
   # belongs_to :user
    # user getter
    # user= setter
    # build_user(attr) won't auto save
    # create_user(attr)
    # create_user!(attr)
    # reload_user


end