class Event < ActiveRecord::Base
    has_many :bookings, foreign_key: "event_id", dependent: :destroy
    has_many :booking_users, through: :bookings, source: :user
    
    has_many :timetables, dependent: :destroy
    
    def booking?(user)
        booking_users.include?(user)
    end
    
    mount_uploader :image, ImageUploader
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
   
   def total_price
     unless price.nil? || price == 0
       bookings.sum(:people, :conditions => "people is not null") * price
     end
   end
end
