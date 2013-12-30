class ChangeUser < ActiveRecord::Migration
  def change
    remove_column :users, :uid
    add_column :users, :uid, :integer
    add_column :users, :gender, :string
    add_column :users, :locale, :string
  end
end
