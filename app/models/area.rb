class Area < ActiveRecord::Base
  has_many :user_areas
  has_many :client_sites, through: :user_areas
  has_many :doc_types
  validates :description, presence: true
  validates :identifier, presence: true
end
