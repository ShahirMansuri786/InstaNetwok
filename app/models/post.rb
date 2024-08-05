class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :post_images , dependent: :destroy
    has_many :likes , as: :likeable , dependent: :destroy
    has_many :comments , dependent: :destroy
end
