class AddLanguageToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :language, :string
  end

  def self.down
    remove_column :projects, :language
  end
end
