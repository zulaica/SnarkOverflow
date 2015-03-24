class ApplicationMailer < ActionMailer::Base
  default from: "admin@snarkoverflow.com"
  layout 'mailer'
end
