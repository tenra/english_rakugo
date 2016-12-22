class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :description, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
