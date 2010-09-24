class Project < ActiveRecord::Base
  has_attached_file :image, :styles => {:medium => "300x300", :thumb => "100x100"}

  validates_presence_of :title
  validates_uniqueness_of :title
end
