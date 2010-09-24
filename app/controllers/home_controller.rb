class HomeController < ApplicationController
  def index
    @post_its = PostIt.all.reverse[0..4]
    @post_notes = PostNote.all.reverse[0..4]
    @projects = Project.all.reverse[0..4]

    @blog_tags = BlogTag.all
  end

  protected

  def authorize
  end

end
