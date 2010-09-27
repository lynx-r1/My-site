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
    session[request.fullpath] = 1 if session[request.fullpath].nil?
    session[request.fullpath] += 1

    logger.info request.fullpath.to_s + " visited " + session[request.fullpath].to_s + " times"
  end

end
