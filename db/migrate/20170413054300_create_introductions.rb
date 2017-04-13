class CreateIntroductions < ActiveRecord::Migration
  def change
    create_table :introductions do |t|
      t.integer :user_id
      t.binary :photo
      t.string :name
      t.text :sentence

      t.timestamps null: false
    end
  end
end
