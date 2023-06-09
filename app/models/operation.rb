class Operation < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups
end
