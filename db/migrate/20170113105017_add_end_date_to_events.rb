class AddEndDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_date, :date
    add_column :events, :end_time, :time
  end
end
