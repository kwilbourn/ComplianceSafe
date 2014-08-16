class DocumentType < ActiveRecord::Base
  has_many :documents, :class_name => "document", :foreign_key => "typeID"
end
