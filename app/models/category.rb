class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expense
  has_many :expense, through: :category_expense

  validates_presence_of :user
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    total = 0
    expense.each do |expense|
      total += expense.amount
    end
    total
  end
end
