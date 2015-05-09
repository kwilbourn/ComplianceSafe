class Account < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  has_one :client_manager
  has_many :documents, through: :users, :dependent => :destroy
  has_many :document_categories, :dependent => :destroy
  accepts_nested_attributes_for :client_manager

  validates :name, presence: true
end
