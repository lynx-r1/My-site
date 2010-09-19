class AddressController < ApplicationController
  def index
    session[:contacts_path] = request.fullpath
  end

  protected

  def authorize
  end

end
