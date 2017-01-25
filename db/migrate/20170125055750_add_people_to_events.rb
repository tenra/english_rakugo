class AddPeopleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :people, :string
    add_column :events, :number, :string
  end
end
