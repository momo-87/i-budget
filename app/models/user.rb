class User < ApplicationRecord
  include ImageUploader::Attachment(:photo)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 250 }

  has_many :groups, dependent: :destroy
  has_many :entities, foreign_key: 'author_id', dependent: :destroy
end
