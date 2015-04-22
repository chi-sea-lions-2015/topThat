class AlertMailer < ApplicationMailer
  default from: 'topthatdevteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(to: @user.email, subject: 'Welcome to the Site')
  end


end
