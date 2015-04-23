class ApplicationMailer < ActionMailer::Base
  include Sidekiq::Mailer
  default from: "topthatdevteam@gmail.com"
  layout 'mailer'
end
