class AddressController < ApplicationController
  def index
    session[:contacts_path] = request.url
  end

end
