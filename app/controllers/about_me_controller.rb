class AboutMeController < ApplicationController
  def index
    @me = User.find_by_name('lynx_r')
  end

  protected

  def authorize
  end

end
