require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Ensure this fixture exists
    sign_in @user
    @category = categories(:one) # Ensure this fixture exists
    @task = tasks(:one) # Ensure this fixture exists
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
    assert_difference('Task.count', 1) do
      post category_tasks_url(@category), params: { task: { name: 'New Task' } }
    end

    new_task = Task.last
    assert_redirected_to category_task_url(@category, new_task)
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
    patch category_task_url(@category, @task), params: { task: { name: 'Updated Task' } }
    assert_redirected_to category_task_url(@category, @task)
    @task.reload
    assert_equal 'Updated Task', @task.name
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_url(@category, @task)
    end
    assert_redirected_to category_tasks_url(@category)
  end
end
