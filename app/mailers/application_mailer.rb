class ApplicationMailer < ActionMailer::Base
  default from: 'wesleycreations@gmail.com'
  layout 'mailer'
  add_template_helper(EmailHelper)

end
