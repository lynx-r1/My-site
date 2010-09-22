class TagsController < ApplicationController
  def index
    @tags = BlogTag.find_all_by_name(params[:tag])
    logger.info @tags
    @posts = []
    @tags.each do |t|
      @posts |= PostIt.find_all_by_id(t.post_it_id) unless t.post_it_id.nil?
      @posts |= PostEvent.find_all_by_id(t.post_event_id) unless t.post_event_id.nil?
    end
  end

end
