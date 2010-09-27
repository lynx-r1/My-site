class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, :except => [:login]
  before_filter :counter

  def self.yandex_metrika
    m = 1515351
    m
  end

  def self.yandex_maps_key
    k = 'ANV9n0wBAAAA63nFPQMAkeJWGr97G_CTpeK11tuV8PtwNZMAAAAAAAAAAAAnPHZZPbk5DlopH6ueTFExZ7BUbg=='
    k
  end

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
