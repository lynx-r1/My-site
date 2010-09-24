class BlogTag < ActiveRecord::Base
  belongs_to :post_it
  belongs_to :post_note
end
