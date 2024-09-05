class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many:posts , dependent: :destroy
  has_one:user_info , dependent: :destroy
  has_many :likes ,through: :posts
  has_one :user_profile , dependent: :destroy
  has_many :following  , foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers  , foreign_key: "followed_id", class_name: "Relationship"
  has_many :messages
  validates :name , :user_name , presence: true

  def all_followed(user_id)
    User.find(Relationship.find(user_id).followed_id).name
  end

  def all_follower(user_id)
    User.find(Relationship.find(user_id).follower_id).name
  end
end
