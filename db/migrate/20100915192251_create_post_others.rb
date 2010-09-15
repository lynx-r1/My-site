class CreatePostOthers < ActiveRecord::Migration
  def self.up
    create_table :post_others do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :post_others
  end
end
