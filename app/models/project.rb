class Project < ActiveRecord::Base
  has_attached_file :image

  validates_presence_of :title
  validates_uniqueness_of :title
end
