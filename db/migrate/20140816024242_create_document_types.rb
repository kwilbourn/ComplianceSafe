class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.integer :typeID
      t.string :description

      t.timestamps
    end
  end
end
