class AddRolesAttributeToClients < ActiveRecord::Migration
  def up
    add_column :clients, :roles_mask, :integer
  end
  def down
    remove_column :clients, :roles_mask
  end
end
