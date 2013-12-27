class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.integer :user_id
      t.string :url, null: false
      t.text :description
      t.datetime :expiration_time
      t.timestamps
    end
  end
end
