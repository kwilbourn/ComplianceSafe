class UserAlertMailer < ActionMailer::Base
  default from: "kevinwilbourn@gmail.com"
  def alert_mail(user)
    mail(:from=> "kevinwilbourn@gmail.com",
          :to => user.email,
          :subject => "Greet User")
  end
  UserMailer.alert_mail(user).deliver!
end
