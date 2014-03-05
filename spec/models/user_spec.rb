require 'spec_helper'

describe User do
  describe "Validation" do
    it "is valid with a name, mail, password" do
      user = User.new(name: 'hoge', mail: 'hoge@hoge.com', password: "hoge", password_confirmation: "hoge")
      expect(user).to be_valid
    end
    it "is invalid without a name" do
      expect(User.new(name: nil)).to have(1).errors_on(:name)
    end
    it "is invalid without a mail" do
      expect(User.new(mail: nil)).to have(1).errors_on(:mail)
    end
    it "is invalid without a password" do
      expect(User.new(password: nil)).to have(1).errors_on(:password)
    end
  end

end
