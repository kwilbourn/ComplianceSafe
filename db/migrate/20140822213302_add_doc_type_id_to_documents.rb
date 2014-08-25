class AddDocTypeIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :doc_type_id, :integer
  end
end
