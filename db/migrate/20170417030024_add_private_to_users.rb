class AddPrivateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :binary
    add_column :users, :private, :boolean, default: false, null: false
    add_column :users, :organizername, :string
    add_column :users, :sentence, :text
    add_column :users, :photo, :binary
  end
end
