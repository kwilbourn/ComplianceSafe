class AddIssuingAuthorityToDocumentType < ActiveRecord::Migration
  def change
    add_column :document_types, :issuing_authority, :string
  end
end
