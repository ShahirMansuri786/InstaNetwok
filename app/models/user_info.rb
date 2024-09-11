class UserInfo < ApplicationRecord
  belongs_to :user
  validates :bio , presence: true
end
