class Document < ActiveRecord::Base
  has_attached_file :document_upload 
  validates_attachment_content_type :document_upload, :content_type => ['application/pdf', 'application/msword', 'text/plain'], :if => :pdf_attached?
  def pdf_attached?
    self.pdf.file?
  end
end
