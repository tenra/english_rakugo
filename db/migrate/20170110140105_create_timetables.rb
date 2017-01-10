class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.references :event, index: true, foreign_key: true
      t.string :time
      t.string :description

      t.timestamps null: false
    end
  end
end
