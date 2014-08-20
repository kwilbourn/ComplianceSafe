class AddAreaIdToDocumentType < ActiveRecord::Migration
  def change
    add_column :document_types, :area_id, :integer
  end
end
