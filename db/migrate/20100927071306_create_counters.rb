class CreateCounters < ActiveRecord::Migration
  def self.up
    create_table :counters do |t|
      t.string :path
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :counters
  end
end
