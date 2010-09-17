class AddTitleContentToPostIts < ActiveRecord::Migration
  def self.up
    add_column :post_its, :title, :string
    add_column :post_its, :content, :text
  end

  def self.down
    remove_column :post_its, :content
    remove_column :post_its, :title
  end
end
