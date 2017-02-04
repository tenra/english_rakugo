class ChangeDefaultPeopleToBookings < ActiveRecord::Migration
  def change
    change_column_default :bookings, :people, 1
  end
end
