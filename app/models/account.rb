class Account < ActiveRecord::Base
  has_many :users
  has_one :client_manager
  has_many :documents, through: :users
  accepts_nested_attributes_for :client_manager

  validates :name, presence: true
end
