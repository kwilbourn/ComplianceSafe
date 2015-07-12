class UserAreas < ActiveRecord::Base
  belongs_to :client
  belongs_to :area
  validates :area, presence: true
end
