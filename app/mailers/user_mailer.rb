class UserMailer < ApplicationMailer
  default from: "admin@snarkoverflow.com"

  def default_url_options
    { :host => "localhost:3000" }
  end
  
  def welcome_email(user)
    @user = user
    @url = "http://snarkoverflow.com/login"
    mail(to: @user.email, subject: "Welcome to Snark Overflow!")
  end
end
