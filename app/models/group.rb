class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :clients, through: :user_groups
  validates :name, presence: true, length: { in: 3..30 }
end
