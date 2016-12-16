class Event < ActiveRecord::Base
    has_many :bookings, foreign_key: "event_id", dependent: :destroy
    has_many :booking_users, through: :bookings, source: :user
    
    def booking?(user)
        booking_users.include?(user)
    end
    
    mount_uploader :image, ImageUploader
    
end
