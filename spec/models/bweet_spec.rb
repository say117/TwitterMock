require 'spec_helper'

describe Bweet do
  describe "Validation" do
    it "is valid with a user_id, description" do
      bweet = Bweet.new(user_id: 1, description: 'hello, bwitter users!')
      expect(bweet).to be_valid
    end
    it "is invalid without a user_id" do
      expect(Bweet.new(user_id: nil)).to have(1).errors_on(:user_id)
    end
    it "is invalid without a description" do
      expect(Bweet.new(description: nil)).to have(1).errors_on(:description)
    end
  end
end
