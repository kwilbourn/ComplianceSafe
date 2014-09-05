class AccountsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer, default: 0
  end
end
