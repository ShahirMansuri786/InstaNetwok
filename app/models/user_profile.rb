class UserProfile < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user

  def find_user_profile(user_id)
    return UserProfile.find_by(user_id: user_id).present?
  end

  def find_user_profile_image(user_id)
    return UserProfile.find_by(user_id: user_id).profile_image.present?
  end

end
