class ResumeController < ApplicationController
  def index
    session[:work_path] = request.url
  end

  protected

  def authorize
  end

end
