class Group < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..30 }
end
