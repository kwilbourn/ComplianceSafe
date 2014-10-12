class UsersDefaultAuthlevelToSite < ActiveRecord::Migration
  def up
    change_column :users, :authlevel, :integer, default: 4
  end
  def down
    
  end
end
