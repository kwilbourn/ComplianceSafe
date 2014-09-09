class UserAlertMailer < ActionMailer::Base
  default from: "notifications@compliance-safe.com"
  
  def document_upload_notice(user, document)
    @user = user
    @document = document
    @subject = "Document Upload Notice: " + @user.name + " : " + @document.permit_number
    
    generate_mail(@user.email, @subject)
  end
  
  def document_verification_status_change(user, document)
    @user = user
    @document = document
    @subject = "Document Verification: " + @user.name + " : " + @document.permit_number
    generate_mail(@user.email, @subject)
  end
  def document_compliance_updated(user, document)
    @user = user
    @document = document
    @subject = "Document Compliance Updated: " + @user.name + " : " + @document.permit_number
    generate_mail(@user.email, @subject)
  end
  protected
  def generate_mail(email, subject)
    mail(to: email, subject: subject)
  end
end
