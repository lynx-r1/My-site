class Counter < ActiveRecord::Base
  def self.increment(path)
    c = Counter.find_by_path(path)
    c = Counter.create(:path => path, :count => 0) if c.nil?
    c.count += 1
    #c.save
  end

  def self.stat
    counters = Counter.all
    c = counters.map {|c| [c.path, c.count] }.flatten
    Hash[*c]
  end

end
