class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :client_code
      t.string :subdomain

      t.timestamps
    end
  end
end
