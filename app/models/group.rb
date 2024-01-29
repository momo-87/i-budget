class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true, length: { maximum: 250 }

  belongs_to :user, foreign_key: 'user_id'
  has_and_belongs_to_many :entities
end
