class Document < ActiveRecord::Base
  has_attached_file :document_upload 
  def expired?
    expiration_date < Time.current()
  end
end
