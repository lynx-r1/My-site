class PostIt < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :blog_tags

  accepts_nested_attributes_for :blog_tags, :allow_destroy => true,
                                :reject_if => proc {|attrs| attrs.all? {|k, v| v.blank?}}
end
