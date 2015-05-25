class CreateDocumentCategories < ActiveRecord::Migration
  def change
    create_table :doc_categories do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
      
    end
    drop_table :document_categories
  end
end
