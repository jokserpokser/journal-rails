require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @category = Category.create(name: "Work")
    @task = Task.new(name: "Test Task", category: @category)
  end

  it "is valid with valid attributes" do
    expect(@task).to be_valid
  end

  it "is invalid with a blank name" do
    @task.name = " "
    expect(@task).not_to be_valid
  end

  it "is invalid with a name shorter than the minimum length" do
    @task.name = "a" * 2
    expect(@task).not_to be_valid
  end

  it "is valid with a name that meets the minimum length requirement" do
    @task.name = "abc"
    expect(@task).to be_valid
  end

  it "belongs to a category" do
    expect(@task.category).to eq(@category)
  end
end
