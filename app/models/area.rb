class Area < ActiveRecord::Base
  has_many :user_areas
  has_many :clients, through: :user_areas
  has_many :doc_types
  validates :description, presence: true, length: {minimum: 3}
  validates :identifier, presence: true
end
