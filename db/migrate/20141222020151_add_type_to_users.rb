class AddTypeToUsers < ActiveRecord::Migration
   def up
    add_column :users, :type, :string
    remove_column :users, :authlevel
  end
  def down
    
  end
end
