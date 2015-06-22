class AddAccountIdToDocCategories < ActiveRecord::Migration
  def change
    add_column :document_categories, :account_id, :integer
  end
end
