require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Write test cases for post" do
    
    context "Validation for post" do
      it { should validate_presence_of(:caption) }
    end
    context "Associatio for post" do
      it { should have_many(:likes) }
      it { should have_many(:comments) }
      it { should belong_to(:user)}
      it { should have_many_attached(:post_images)}
    end
  end
end
