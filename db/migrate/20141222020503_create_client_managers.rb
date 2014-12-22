class CreateClientManagers < ActiveRecord::Migration
  def change
    create_table :client_managers do |t|

      t.timestamps
    end
  end
end
