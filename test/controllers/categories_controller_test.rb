require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end
  
  test "should create new category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: "UNIQUE NAME", description: "CATEGORY DESCRIPTION" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: {category: { name: "UPDATED NAME", description: "UPDATED DESCRIPTION" } }
    assert_redirected_to category_url(@category)
  end
end
