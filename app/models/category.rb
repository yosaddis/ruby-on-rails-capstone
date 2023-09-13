class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transaction
  has_many :transaction, through: :category_transaction

  validates_presence_of :user
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    total = 0
    transaction.each do |transaction|
      total += transaction.amount
    end
    total
  end
end
