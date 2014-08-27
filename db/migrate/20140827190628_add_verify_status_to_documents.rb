class AddVerifyStatusToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :verify, :integer, default: 0
  end
end
