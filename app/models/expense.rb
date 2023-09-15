class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expense, dependent: :destroy
  has_many :category, through: :category_expense

  validates_presence_of :name, :amount
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :amount, presence: true
end
