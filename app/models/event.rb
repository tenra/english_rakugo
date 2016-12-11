class Event < ActiveRecord::Base
    has_many :bookings, foreign_key: "event_id", dependent: :destroy
    has_many :users, through: :bookings
    
    has_many :joins, class_name: "Join", foreign_key: "event_id", dependent: :destroy
    has_many :join_users, through: :joins, source: :user
end
