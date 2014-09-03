class AddAuthLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authlevel, :integer, default: 0
    remove_column :users, :admin
  end
end
