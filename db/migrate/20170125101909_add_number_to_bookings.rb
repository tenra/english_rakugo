class AddNumberToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :number, :string
  end
end
