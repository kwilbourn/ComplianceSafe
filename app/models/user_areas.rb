class UserAreas < ActiveRecord::Base
  belongs_to :client
  belongs_to :area
end
