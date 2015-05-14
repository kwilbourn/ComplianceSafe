class DocCategory < ActiveRecord::Base
  validates :name, presence: true
end
