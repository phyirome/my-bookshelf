class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :comments
  has_one_attached :image

  validates :title, :author, :publisher, :description, :image, presence: true 
end
