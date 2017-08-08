ActionMailer::Base.smtp_settings = {
  port:              ENV['MAILGUN_SMTP_PORT'],
  address:           ENV['MAILGUN_SMTP_SERVER'],
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            ENV['DOMAIN_NAME'],
  authentication:    :plain,
  content_type:      'text/html'
}
