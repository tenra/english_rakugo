class Introduction < ActiveRecord::Base
    belongs_to :user
    has_many :events, foreign_key: "introduction_id", dependent: :destroy
    
    mount_uploader :photo, PhotoUploader
end
