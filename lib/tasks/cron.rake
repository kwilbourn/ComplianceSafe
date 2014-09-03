namespace :cron do
  desc "Send Document Expiration Alerts"
  task deliver_emails: :environment do
    user_alert_options = User.alert_options[]
    documents_to_alert = Document.where(expiration_date.in?(user_alert_options) )
    documents_to_alert.each do |document|
      PermitExpireAlert.alert_email(User, document).deliver
      Rails.logger.info "Sent Document Expiration Alerts"
    end
  end
end