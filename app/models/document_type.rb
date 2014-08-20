class DocumentType < ActiveRecord::Base
  has_many :documents
  belongs_to :areas
end
