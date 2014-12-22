class CreateClientSites < ActiveRecord::Migration
  def change
    create_table :client_sites do |t|

      t.timestamps
    end
  end
end
