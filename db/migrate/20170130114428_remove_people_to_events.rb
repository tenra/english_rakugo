class RemovePeopleToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :people, :string
  end
end
