class AddAccountIdToDocCategories < ActiveRecord::Migration
  def change
    add_column :doc_categories, :account_id, :integer
  end
end
