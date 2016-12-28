class AddDatesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    add_column :events, :price, :integer
    add_column :events, :capacity, :integer
  end
end
