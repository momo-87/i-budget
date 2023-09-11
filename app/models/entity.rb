class Entity < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { decimal: true, greater_than_or_equal_to: 0 }

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :groups, dependent: :destroy
end
