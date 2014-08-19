class RemoveCreatedFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :created, :datetime
    remove_column :documents, :modified, :datetime
  end
end
