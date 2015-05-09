class DocumentCategory < ActiveRecord::Base
  has_many :documents
  belongs_to :account
end
