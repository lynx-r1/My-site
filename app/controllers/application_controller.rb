class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, :except => [:login]

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      redirect_to admin_login_path
    end
  end
end
