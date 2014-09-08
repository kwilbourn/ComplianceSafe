class AddReplacedByToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :replaced_by, :integer
  end
end
