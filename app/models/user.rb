class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many:posts
         has_one:user_info
         has_many :liks ,through: :posts
         has_one :user_profile

end