class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :private, :boolean, default: false, null: false
  end
end
