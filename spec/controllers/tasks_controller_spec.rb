require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  fixtures :users, :categories, :tasks

  before do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @task = tasks(:one)
  end

  describe "GET #index" do
    it "returns a success response and assigns tasks" do
      get :index, params: { category_id: @category.id }
      expect(response).to be_successful
      expect(assigns(:tasks)).not_to be_nil
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { category_id: @category.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new task and redirects to the task's show page" do
      expect {
        post :create, params: { category_id: @category.id, task: { name: 'New Task' } }
      }.to change(Task, :count).by(1)

      new_task = Task.last
      expect(response).to redirect_to(category_task_path(@category, new_task))
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { category_id: @category.id, id: @task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { category_id: @category.id, id: @task.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    it "updates the task and redirects to the task's show page" do
      patch :update, params: { category_id: @category.id, id: @task.id, task: { name: 'Updated Task' } }
      expect(response).to redirect_to(category_task_path(@category, @task))
      @task.reload
      expect(@task.name).to eq('Updated Task')
    end
  end

  describe "DELETE #destroy" do
    it "destroys the task and redirects to the tasks index page" do
      expect {
        delete :destroy, params: { category_id: @category.id, id: @task.id }
      }.to change(Task, :count).by(-1)
      expect(response).to redirect_to(category_tasks_path(@category))
    end
  end
end
