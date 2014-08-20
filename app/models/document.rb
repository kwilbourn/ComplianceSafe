class Document < ActiveRecord::Base
  belongs_to :document_type
  has_attached_file :document_upload,
    :path => '/system/uploads/' 
  def expired?
    expiration_date < Time.current()
  end
end
