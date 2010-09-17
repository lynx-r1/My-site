class ServiceController < ApplicationController
  def index
    session[:work_path] = request.url
  end

end
