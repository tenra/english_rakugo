class Top include ActiveModel::Model
 
  attr_accessor :name, :email, :message
 
  validates :name, length: { maximum: 20 } , presence: true
  validates :email, length: { maximum: 20 } , presence: true
  validates :message , length: { minimum: 2, maximum: 30 } , presence: true
end