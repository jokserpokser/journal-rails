require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Example Category", description: "Example description")
  end

  test "should be valid with a name and description" do
    assert @category.valid?
  end

  test "should be invalid without a name" do
    @category.name = nil
    assert_not @category.valid?
  end

  test "should be invalid without a description" do
    @category.description = nil
    assert_not @category.valid?
  end

  test "should be invalid with a duplicate name" do
    @category.save
    duplicate_category = Category.new(name: @category.name, description: "Another description")
    assert_not duplicate_category.valid?
  end
end