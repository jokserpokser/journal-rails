require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new
  end

  test "should be valid with a name" do
    assert @category.valid?
  end

  test "should be invalid without a name" do
    @category.name = nil
    assert_not @category.valid?
  end

  test "should be invalid with a duplicate name" do
    duplicate_category = @category.dup
    @category.save
    assert_not duplicate_category.valid?
  end
end
