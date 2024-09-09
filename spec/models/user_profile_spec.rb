require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  describe "Write test cases for user_profile" do
    context "Associatio for user_profile" do
      it { should belong_to(:user)}
      it { should have_one_attached(:profile_image)}
    end
  end
end
