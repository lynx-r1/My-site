require 'test_helper'

class PostNoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "create note" do
    note = PostNote.new(:one)
    assert !note.save
  end
end
