class PermitExpireAlert < ActionMailer::Base
  default from: "notifications@compliance-safe.com"
  
  def alert_email(user, document)
    @user = user
    @document = document
    @subject = "Permit Expiration Alert for Permit Number" + @document.permit_number
    mail(to: @user.email, subject: @subject)
  end
  
end
