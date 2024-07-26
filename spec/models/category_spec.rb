require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = Category.new(name: "Example Category", description: "Example description")
  end

  it "is valid with a name and description" do
    expect(@category).to be_valid
  end

  it "is invalid without a name" do
    @category.name = nil
    expect(@category).not_to be_valid
  end

  it "is invalid without a description" do
    @category.description = nil
    expect(@category).not_to be_valid
  end

  it "is invalid with a duplicate name" do
    @category.save
    duplicate_category = Category.new(name: @category.name, description: "Another description")
    expect(duplicate_category).not_to be_valid
  end
end
