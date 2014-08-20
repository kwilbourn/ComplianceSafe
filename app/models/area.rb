class Area < ActiveRecord::Base
  has_many :user_areas
  has_many :users, through: :user_areas
  has_many :document_types
end
