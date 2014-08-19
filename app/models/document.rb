class Document < ActiveRecord::Base
  belongs_to :document_type, :class_name => "document_type", :foreign_key => "document_type_id"
  has_attached_file :document_upload 
  def expired?
    expiration_date < Time.current()
  end
end
