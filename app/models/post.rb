class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :post_images
    has_many :likes , as: :likeable
end
