class RemoveTypeIdFromDocumentTypes < ActiveRecord::Migration
  def change
    remove_column :document_types, :typeID, :integer
  end
end
