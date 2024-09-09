require 'rails_helper'

RSpec.describe UserInfo, type: :model do
  describe "Write test cases for user_bio" do
    context "Validation for user_bio" do
      it { should validate_presence_of(:bio) }
    end
    context "Associatio for user_info" do
      it { should belong_to(:user)}
    end
  end
end
