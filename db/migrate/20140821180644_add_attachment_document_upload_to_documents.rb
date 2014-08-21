class AddAttachmentDocumentUploadToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :document_upload
    end
  end

  def self.down
    remove_attachment :documents, :document_upload
  end
end
