class ExpenseController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expense.order(created_at: :desc)

    redirect_to new_user_session_path, notice: 'You must be logged in to access this page' unless current_user
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(user_id: current_user.id, **expense_params)

    if @expense.save
      @category_expense = CategoryExpense.create(category_id: params[:category_id], expense_id: @expense.id)
      redirect_to category_expense_index_path, notice: 'expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_expense
    @expense = expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
