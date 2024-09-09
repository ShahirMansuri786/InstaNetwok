require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Write test cases for user" do
    context "Validation for user" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:user_name) }
    end
    context "Associatio for user" do
      it { should have_many(:posts) }
      it { should have_one(:user_info) }
      it { should have_many(:likes) }
      it { should have_one(:user_profile) }
      it { should have_many(:following) }
      it { should have_many(:followers) }
      it { should have_many(:messages) }
    end
  end
end
