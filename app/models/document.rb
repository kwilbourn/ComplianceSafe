class Document < ActiveRecord::Base
  enum verify: [ :unverified, :verified, :incorrect, :needs_documentation, :replaced ]
  belongs_to :doc_type
  belongs_to :user
  belongs_to :account
  has_attached_file :document_upload
  
  #validates_with AttachmentPresenceValidator, :attributes => :document_upload
  validates_with AttachmentSizeValidator, :attributes => :document_upload, :less_than => 2.megabytes
  do_not_validate_attachment_file_type :document_upload 
  
  def days_left?
    now = Date.today
    return (expiration_date - now).to_i
  end
  scope :pending_notice, lambda {
    |alert_days| where("expiration_date = ?", Date.today + alert_days) 
  }
  scope :for_user, lambda {
    |user| where("user_id = ?", user)
  }
  scope :verification_status, lambda {
    |verification_status| where("verify = ?", verification_status)
  }
  def next_verify
    Document.where("id > ?", self.id).where("verify = ?", 0).first
  end
  def prev_verify
    Document.where("id < ?", self.id).where("verify = ?", 0).last
  end
  
  def self.send_alerts
    User.with_settings.find_each do |user|
      user.settings(:alerts).days.each do |alert_value| 
          Document.for_user(user).pending_notice(alert_value).find_each do |document|
            PermitExpireAlert.alert_email(document.user, document).deliver
          end
      end
    end
  end
def self.search(search)
  if search
    where('permit_number LIKE ?', "%#{search}%")
  else
    all
  end
end
end
