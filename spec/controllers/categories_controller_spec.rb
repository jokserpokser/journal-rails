require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  fixtures :users, :categories

  before do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @category.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new category" do
      expect {
        post :create, params: { category: { name: "UNIQUE NAME", description: "CATEGORY DESCRIPTION" } }
      }.to change(Category, :count).by(1)
      expect(response).to redirect_to(category_path(Category.last))
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: @category.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    it "updates the category" do
      patch :update, params: { id: @category.id, category: { name: "UPDATED NAME", description: "UPDATED DESCRIPTION" } }
      expect(response).to redirect_to(category_path(@category))
    end
  end
end
