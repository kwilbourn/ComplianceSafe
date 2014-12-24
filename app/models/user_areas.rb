class UserAreas < ActiveRecord::Base
  belongs_to :client_site
  belongs_to :area
end
