require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "create project" do
    project = Project.new(:one)
    assert !project.save
  end
end
