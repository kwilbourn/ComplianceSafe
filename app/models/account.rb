class Account < ActiveRecord::Base
  has_many :clients, :dependent => :destroy
  has_many :documents, through: :users, :dependent => :destroy
  has_many :document_categories, :dependent => :destroy
  has_one :owner, -> { where role: 'owner' }, class_name: "Client"
  validates :name, presence: true, length: { in: 3..30 }
  validate :create_subdomain
  validate :require_at_least_one_user
  validates :subdomain, presence: true
  def require_at_least_one_user
        errors.add(:user, "At least one user is required.") if self.owner.blank? && self.clients.blank?
  end
  def create_subdomain
    if self.subdomain.blank?
      self.subdomain = name.downcase.gsub(/\s+/, "")
    end
  end
end
