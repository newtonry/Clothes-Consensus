class RemoveLocale < ActiveRecord::Migration
  def change
    remove_column :users, :locale, :string
  end
end
