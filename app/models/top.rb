class Top include ActiveModel::Model
 
  attr_accessor :name, :email, :message
 
  validates :name, length: { maximum: 20 } , presence: true
  validates :email, length: { maximum: 30 } , presence: true
  validates :message , length: { maximum: 50 } , presence: true
end