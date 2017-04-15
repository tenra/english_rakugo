class Event < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :introduction
    has_many :bookings, foreign_key: "event_id", dependent: :destroy
    has_many :booking_users, through: :bookings, source: :user
    
    has_many :timetables, dependent: :destroy
    
    def booking?(user)
        booking_users.include?(user)
    end
    
    mount_uploader :image, ImageUploader
    mount_uploader :image2, ImageUploader
    mount_uploader :image3, ImageUploader
    mount_uploader :image4, ImageUploader
    mount_uploader :image5, ImageUploader
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
   
   def total_price
     unless price.nil? || price == 0
       bookings.sum(:people, :conditions => "people is not null") * price
     end
   end
end
