class FormMailer < ActionMailer::Base
  default from: 'contactform@poujade.org'

  def send_visitor_message contents
    @from_email = contents.sender_addr
    @from_name  = contents.sender_name
    @message    = contents.sender_message

    mail to: 'py@poujade.org', subject: 'A message from a visitor', reply_to: "#{@from_name} <#{@from_email}>"
  end
end
