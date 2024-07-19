require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get category_tasks_url(@category)
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get new_category_task_url(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_url(@category), params: { task: { name: 'New Task' } }
    end

    assert_redirected_to category_tasks_url(@category)
  end

  test "should show task" do
    get category_task_url(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_url(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: { task: { name: 'Updated Task' } }
    assert_redirected_to category_task_url(@category, @task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_url(@category, @task)
    end

    assert_redirected_to category_tasks_url(@category)
  end

  private

  def setup_category_and_task
    @category = Category.create(name: "Sample Category")
    @task = @category.tasks.create(name: "Sample Task")
  end
end
