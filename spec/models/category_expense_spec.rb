require 'rails_helper'

RSpec.describe CategoryExpense, type: :model do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'test@test.com', password: '123456')
    expect(@user1).to be_valid
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
    @expense1 = Expense.create(name: 'Product1', amount: 100, user: @user1)
    @category_expense1 = CategoryExpense.create(category: @category1, expense: @expense1)
  end

  it 'is valid with valid attributes' do
    expect(@category_expense1).to be_valid
  end
end
