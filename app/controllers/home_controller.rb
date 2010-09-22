class HomeController < ApplicationController
  def index
    @post_its = PostIt.all.reverse[0..4]
    @post_events = PostEvent.all.reverse[0..4]
    @projects = Project.all.reverse[0..4]

    @blog_tags = BlogTag.all
  end

  protected

  def authorize
  end

end
