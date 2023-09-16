require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'test@test.com', password: '123456')
    expect(@user1).to be_valid
    @expense1 = Expense.create(name: 'Expense1', amount: 1000, user: @user1)
  end

  it 'is valid with valid attributes' do
    expect(@expense1).to be_valid
  end

  it 'is not valid without a name' do
    @expense1.name = nil
    expect(@expense1).to_not be_valid
  end

  it 'is not valid without an amount' do
    @expense1.amount = nil
    expect(@expense1).to_not be_valid
  end
end
