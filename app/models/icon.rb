class Icon < ApplicationRecord
  validates :url, presence: true
  validates :category, presence: true
end
