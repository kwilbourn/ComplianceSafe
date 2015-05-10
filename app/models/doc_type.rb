class DocType < ActiveRecord::Base
  has_many :documents
  belongs_to :area
   has_attached_file :sample_file
  validates_with AttachmentSizeValidator, :attributes => :sample_file, :less_than => 2.megabytes
  do_not_validate_attachment_file_type :sample_file 
  validates :issuing_authority, presence: true
  validates :description, presence: true
end
