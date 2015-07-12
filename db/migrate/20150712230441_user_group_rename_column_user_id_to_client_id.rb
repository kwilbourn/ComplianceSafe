class UserGroupRenameColumnUserIdToClientId < ActiveRecord::Migration
  def up
    add_column :user_groups, :client_id, :integer
    remove_column :user_groups, :user_id
  end
  def down
    add_column :user_groups, :user_id, :integer
    remove_column :user_groups, :client_id
  end
end
