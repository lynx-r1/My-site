module ApplicationHelper
  def user_logged(&block)
    if User.find_by_id(session[:user_id])
      block.call
    end
  end

  def user_unlogged(&block)
    unless User.find_by_id(session[:user_id])
      block.call
    end
  end

  def join_tags(tags, delimiter = " ")
    tags.map {
      |t| link_to(t.name, tags_index_path(:tag => t.name))
    }.join(delimiter)
  end

  def join_tags_add_class_count_make_uniq(tags, delimiter = " ")
    tags.map {
      |t| link_to(t.name, tags_index_path(:tag => t.name),
                  :class => "tag-" + tags.map {|_t| _t.name}.count(t.name).to_s)
    }.uniq.join(delimiter)
  end

end
