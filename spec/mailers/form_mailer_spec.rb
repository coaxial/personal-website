require "rails_helper"

RSpec.describe FormMailer, :type => :mailer do
  let(:contents) {
    {
      sender_addr:    'visitor@example.com',
      sender_name:    'John Doe',
      sender_message: 'Howdy partner!'
    }
  }
  let(:contact_form) { ContactForm.new contents }
  let(:mail) { FormMailer.send_visitor_message(contact_form).deliver }

  it "addresses the email to me" do
    expect(mail.to).to eq(['py@poujade.org'])
  end

  it "includes the visitor's email" do
    # Can't use have_content because it turns <foo> into an HTML tag
    expect(mail.body).to match(/#{contact_form.sender_addr}/)
  end

  it "includes the visitor's name" do
    expect(mail.body).to have_content(contact_form.sender_name)
  end

  it "includes the visitor's message" do
    expect(mail.body).to have_content(contact_form.sender_message)
  end

  it "uses the visitor's email as the reply-to address" do
    expect(mail.reply_to).to eq ([contact_form.sender_addr])
  end

  it "queues the message for sending" do
    FormMailer.send_visitor_message(contact_form).deliver

    expect(ActionMailer::Base.deliveries).to_not be_empty
  end

end
