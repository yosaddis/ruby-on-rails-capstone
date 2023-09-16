require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'test@test.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it 'is not valid without a name' do
    @user1.name = nil
    expect(@user1).to_not be_valid
  end

  it 'is not valid without an email' do
    @user1.email = nil
    expect(@user1).to_not be_valid
  end
end
