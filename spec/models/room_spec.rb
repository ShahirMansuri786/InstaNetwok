require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "Write test cases for room" do
    context "Validation for user" do
      it { should validate_presence_of(:created_for) }
      it { should validate_presence_of(:created_by) }
    end
    context "Associatio for room" do
      it { should have_many(:messages) }
    end
  end
end
