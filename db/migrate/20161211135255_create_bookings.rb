class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:user_id, :event_id], unique: true
    end
  end
end
