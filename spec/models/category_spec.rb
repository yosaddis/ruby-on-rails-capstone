require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'test@test.com', password: '123456')
    expect(@user1).to be_valid
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
  end

  it 'is valid with valid attributes' do
    expect(@category1).to be_valid
  end

  it 'is not valid without a name' do
    @category1.name = nil
    expect(@category1).to_not be_valid
  end

  it 'is not valid without an icon' do
    @category1.icon = nil
    expect(@category1).to_not be_valid
  end
end
