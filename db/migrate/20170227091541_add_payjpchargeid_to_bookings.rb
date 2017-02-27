class AddPayjpchargeidToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :payjp_charge_id, :string
  end
end
