class Tag < ApplicationRecord
  has_and_belongs_to_many :account_transactions, class_name: "Transaction"
  validates :name, presence: true
  enum status: [:active, :inactive]
end
