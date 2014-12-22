class CreateClientViewers < ActiveRecord::Migration
  def change
    create_table :client_viewers do |t|

      t.timestamps
    end
  end
end
