class Document < ActiveRecord::Base
  belongs_to :doc_type
  belongs_to :user
  has_attached_file :document_upload
  validates :document_upload, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :document_upload
  validates_with AttachmentSizeValidator, :attributes => :document_upload, :less_than => 2.megabytes
  do_not_validate_attachment_file_type :document_upload 
  def days_left?
    now = Date.today
    return expiration_date - now
  end
end
