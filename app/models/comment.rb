class Comment < ApplicationRecord
  belongs_to :post
  has_many :likes , as: :likeable , dependent: :destroy
  validates :comment_text , presence: true
end
