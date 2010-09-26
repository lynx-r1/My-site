class HomeController < ApplicationController
  def index
    @post_its = PostIt.all.reverse[0..4]
    @post_notes = PostNote.all.reverse[0..4]
    @projects = Project.all.reverse[0..4]

    @blog_it_tags = BlogTag.find_all_by_post_it_id;
    @blog_note_tags = BlogTag.find_all_by_post_note_id;
  end

  protected

  def authorize
  end

end
