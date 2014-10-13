class WebsiteController < ApplicationController
  include WebsiteHelper

  def index
    @greeting = time_greeting
  end

  def about
    @age_in_secs = age_in_secs(1986, 07, 25, 0, 30)
    @last_github_commit_timestamp = last_github_commit_timestamp
  end

  def contact
  end

  def writeme
    @contact_form = ContactForm.new params[:writeme]

    if @contact_form.valid?
      FormMailer.send_visitor_message(@contact_form).deliver
      flash[:notice] = "Message sent."
      redirect_to action: :contact
    else
      flash[:alert]  = "Message not sent."
      flash[:errors] = @contact_form.errors.full_messages
      redirect_to action: :index, params: params
    end
  end
end
