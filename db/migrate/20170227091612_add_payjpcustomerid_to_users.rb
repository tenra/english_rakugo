class AddPayjpcustomeridToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payjp_customer_id, :string
  end
end
