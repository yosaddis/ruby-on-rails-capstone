require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'User1', email: 'test@test.com', password: '123456')
    @category1 = Category.create(name: 'Category1', icon: 'icon1', user: @user1)
    @expense1 = Expense.create(name: 'Expense1', amount: 100, user: @user1)
    @category_expense1 = CategoryExpense.create(category: @category1, expense: @expense1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'Can access the expense index page' do
    visit "/category/#{@category1.id}/expense"
    expect(page).to have_content('EXPENSES')
  end

  it 'Show expense' do
    visit "/category/#{@category1.id}/expense"
    expect(page).to have_content('Expense1')
  end

  it 'Show expense amount' do
    visit "/category/#{@category1.id}/expense"
    expect(page).to have_content('100')
  end

  it 'Can create a new expense' do
    visit "/category/#{@category1.id}/expense"
    click_link 'New expense'
    expect(page).to have_content('Create New expense')
  end
end
