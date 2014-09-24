class WebsiteController < ApplicationController
  include WebsiteHelper

  def index
    @greeting = time_greeting
  end
end
