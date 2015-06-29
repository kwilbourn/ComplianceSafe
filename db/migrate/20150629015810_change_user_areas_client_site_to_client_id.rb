class ChangeUserAreasClientSiteToClientId < ActiveRecord::Migration
  def up
    add_column :user_areas, :client_id, :integer
    remove_column :user_areas, :user_id
  end
end
