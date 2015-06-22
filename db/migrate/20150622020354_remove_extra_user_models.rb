class RemoveExtraUserModels < ActiveRecord::Migration
  def change
    drop_table :managers
    drop_table :client_viewers
  end
end
