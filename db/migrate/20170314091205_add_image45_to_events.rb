class AddImage45ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image4, :string
    add_column :events, :image5, :string
  end
end
