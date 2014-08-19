class RemoveTypeIdFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :type_ID, :integer
    remove_column :documents, :user_ID, :integer
  end
end
