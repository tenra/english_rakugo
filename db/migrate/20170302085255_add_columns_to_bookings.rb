class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :payment, :boolean, default: false, null: false
  end
end
