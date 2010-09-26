require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "create feedback" do
    feedback = Feedback.new(:one)
    assert !feedback.save
  end
end
