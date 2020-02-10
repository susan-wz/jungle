require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "can save with all valid attributes" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to be_valid
    end

    it "is not valid without a email" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: nil, password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a first name" do
      @user = User.new(first_name: nil, last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user = User.new(first_name: "Henry", last_name: nil, email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a password" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: nil, password_confirmation: "123456")
      @user.save
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a password confirmation" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: nil)
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid if the password and password confirmation don't match" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "sdfsdf")
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid if the email is not unique" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      @user2 = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user2.save
      expect(@user2).to_not be_valid
    end

    it "is not valid if the password is shorter than 6 characters" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "allows a user to login with whitespace around their email" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("  henries@henry.com", "123456")).eql?(@user)
    end
    it "allows a user to login if they type their email in the wrong case" do
      @user = User.new(first_name: "Henry", last_name: "Henryson", email: "henries@henry.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("HENRIES@henry.com", "123456")).eql?(@user)
    end
  end
end
