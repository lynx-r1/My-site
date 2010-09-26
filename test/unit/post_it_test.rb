require 'test_helper'

class PostItTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "create it" do
    it = PostIt.new(:one)
    assert !it.save
  end
end
