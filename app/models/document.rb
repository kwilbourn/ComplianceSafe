class Document < ActiveRecord::Base
  belongs_to :doc_type
  belongs_to :user
  has_attached_file :document_upload
  validates :document_upload, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :document_upload
  validates_with AttachmentSizeValidator, :attributes => :document_upload, :less_than => 2.megabytes
  do_not_validate_attachment_file_type :document_upload 
  def expired?
    expiration_date < Time.current()
  end
  def days_left?
    now = Date.today
    return expiration_date - now
  end
  scope :pending_notice, lambda {
    |alert_days| where("expiration_date = ?", Date.today + alert_days) 
  }
  scope :for_user, lambda {
    |user| where("user_id = ?", user)
  }
  def self.send_alerts
    User.with_settings.find_each do |user|
      user.settings(:alerts).days.each do |alert_value| 
          Document.for_user(user).pending_notice(alert_value).find_each do |document|
            PermitExpireAlert.alert_email(document.user, document).deliver
          end
      end
    end
  end
end
