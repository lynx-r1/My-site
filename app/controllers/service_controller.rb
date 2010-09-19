class ServiceController < ApplicationController
  def index
    session[:work_path] = request.fullpath
  end

  protected

  def authorize
  end

end
