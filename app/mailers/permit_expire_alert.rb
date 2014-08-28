class PermitExpireAlert < ActionMailer::Base
  default from: "notifications@compliance-safe.com"
  
  def alert_email(user, document)
    @user = user
    @document = document
    mail(to: @user.email, subject: 'Permit Expiration Alert - @document')
  end
  
end
