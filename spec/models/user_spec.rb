require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "checks the password against database" do
      @user = User.new(email: "asdf@asdf.com", password: "qwerty21")
      expect(@user.is_password?("qwerty21")).to be true
      expect(@user.is_password?("wrongpass")).to be false
    end
  end

  describe "#reset_session_token" do
    it "should reset the session token" do
      @user = User.new(email: "asdf@asdf.com", password: "qwerty21")
      session_token = @user.session_token
      expect(@user.reset_session_token!).not_to eq(session_token)
    end
  end

  describe "::find_by_credentials" do
    before(:all) do
      @user = User.create(email: "asdf@asdf.com", password: "qwerty21")
    end
    it "should pull user out by email and password" do
      expect(User.find_by_credentials("asdf@asdf.com", "qwerty21")).to eq(@user)
    end
    it "should not allow incorrect password" do
      expect(User.find_by_credentials("asdf@asdf.com", "wrong")).to be_nil
    end
    after(:all) do 
      User.find_by(email: "asdf@asdf.com").destroy
    end
  end

end
