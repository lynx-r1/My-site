class FeedbackController < ApplicationController
  def index
    session[:contacts_path] = request.url
  end

  protected

  def authorize
  end

end
