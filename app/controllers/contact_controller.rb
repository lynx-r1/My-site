class ContactController < ApplicationController
  def index
    if session[:contacts_path]
      redirect_to session[:contacts_path]
    else
      redirect_to address_index_path
    end
  end
end
