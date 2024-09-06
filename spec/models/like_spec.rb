require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "Write test cases for like" do
    context "Associatio for like" do
      it { should belong_to(:likeable) }
    end
  end
end
