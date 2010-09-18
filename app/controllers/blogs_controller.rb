class BlogsController < ApplicationController
  def index
    if session[:blogs_path]
      redirect_to session[:blogs_path]
    else
      redirect_to post_its_path
    end
  end

  protected

  def authorize
  end

end
