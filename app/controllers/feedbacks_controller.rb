class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all

    session[:contacts_path] = request.fullpath
    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end

  def create
    @feedback = Feedback.create!(params[:feedback])
    respond_to do |format|
      format.html { redirect_to feedbacks_path }
      format.js
    end
  end

  def destroy
     @feedback = Feedback.find(params[:id])
     @feedback.destroy
     respond_to do |format|
       format.html { redirect_to feedbacks_path }
       format.js
     end
   end

  protected

  def authorize
  end

end
