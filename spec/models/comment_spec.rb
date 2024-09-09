require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Write test cases for comment" do
    context "Validation for comment" do
      it { should validate_presence_of(:comment_text) }
    end
    context "Associatio for comment" do
      it { should have_many(:likes) }
      it { should belong_to(:post)}
    end
  end
end
