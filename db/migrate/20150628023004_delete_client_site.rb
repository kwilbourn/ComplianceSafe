class DeleteClientSite < ActiveRecord::Migration
  def change
        drop_table :client_sites
  end
end
