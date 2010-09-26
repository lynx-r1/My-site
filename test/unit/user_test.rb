require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "create user" do
    user = User.new(:one)
    assert !user.save
  end
end
