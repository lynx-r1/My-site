class WorkController < ApplicationController
  def index
    if session[:work_path]
      redirect_to session[:work_path]
    else
      redirect_to projects_path
    end
  end

  protected

  def authorize
  end

end
