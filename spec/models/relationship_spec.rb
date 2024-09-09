require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "Write test cases for relationships" do
    context "Associatio for relationships" do
      it { should belong_to(:follower) }
      it { should belong_to(:followed) }
    end
  end
end
