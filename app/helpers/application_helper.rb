module ApplicationHelper
  def user_logged(&block)
    if User.find_by_id(session[:user_id])
      block.call
    end
  end

end
