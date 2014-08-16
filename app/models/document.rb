class Document < ActiveRecord::Base
  belongs_to :document_type, :class_name => "document_type", :foreign_key => "document_type_id"
  has_attached_file :document_upload 
  validates_attachment_content_type :document_upload, :content_type => ['application/pdf', 'application/msword', 'text/plain'], :if => :pdf_attached?
  def pdf_attached?
    self.pdf.file?
  end
end
