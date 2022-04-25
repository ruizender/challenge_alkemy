class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },presence: true, uniqueness: true
                    
  require 'sendgrid-ruby'
  include SendGrid
  
  def send_email
    user_email = self.email
    from = Email.new(email: 'ruiz.valera@gmail.com')
    to = Email.new(email: user_email)
    subject = "Successful registration"
    content = Content.new(type: 'text/plain', value: "Welcome to our disney characters API,\n\nThanks for registering")
    mail = Mail.new(from, subject, to, content)
    key = ENV['SENDGRID_API_KEY']
    sg = SendGrid::API.new(api_key: "#{key}")
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
