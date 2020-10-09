class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :comments

  validates :content, :rating, presence: true
end
