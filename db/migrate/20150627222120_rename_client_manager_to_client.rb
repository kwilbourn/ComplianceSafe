class RenameClientManagerToClient < ActiveRecord::Migration
  def change
    rename_table :client_managers, :clients
  end
end
