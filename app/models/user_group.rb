class UserGroup < ActiveRecord::Base
  belongs_to :client
  belongs_to :group
  validates :client, presence: true
  validates :group, presence: true
end
