class CreatePostNotes < ActiveRecord::Migration
  def self.up
    create_table :post_notes do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :post_notes
  end
end
