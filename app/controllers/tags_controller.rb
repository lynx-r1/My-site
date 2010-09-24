class TagsController < ApplicationController
  def index
    @tags = BlogTag.find_all_by_name(params[:tag])
    @posts = []
    @tags.each do |t|
      @posts |= PostIt.find_all_by_id(t.post_it_id) unless t.post_it_id.nil?
      @posts |= PostNote.find_all_by_id(t.post_note_id) unless t.post_note_id.nil?
    end
  end

end
