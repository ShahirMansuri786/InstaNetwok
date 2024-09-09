require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Write test cases for message" do
    context "Validation for message" do
      it { should validate_presence_of(:content) }
    end
    context "Associatio for message" do
      it { should belong_to(:user) }
      it { should belong_to(:room) }
    end
  end
end
