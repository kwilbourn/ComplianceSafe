class DocType < ActiveRecord::Base
  has_many :documents
  belongs_to :area
end
