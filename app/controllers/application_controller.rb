class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, :except => [:login]
  before_filter :counter

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.fullpath
      redirect_to admin_login_path
    end
  end

  def counter
    Counter.increment(request.fullpath)
  end

end
