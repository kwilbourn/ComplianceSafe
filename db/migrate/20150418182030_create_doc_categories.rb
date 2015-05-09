class CreateDocCategories < ActiveRecord::Migration
  def change
    create_table :doc_categories do |t|
      t.string :name
      t.integer :id
      t.integer :account_id

      t.timestamps
    end
  end
end
