class UserAreas < ActiveRecord::Base
  belongs_to :user
  belongs_to :area
end
