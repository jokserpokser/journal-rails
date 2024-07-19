require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @category = Category.create(name: "Work")
    @task = Task.new(name: "Test Task", category: @category)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "name should be present" do
    @task.name = " "
    assert_not @task.valid?
  end

  test "name should have a minimum length" do
    @task.name = "a" * 2
    assert_not @task.valid?
  end

  test "name should be at least 3 characters" do
    @task.name = "abc"
    assert @task.valid?
  end

  test "should belong to a category" do
    assert @task.category == @category
  end
end
