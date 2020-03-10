require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    #making test user by filling in our own data
    test_user = User.new(first_name: "John", last_name: "Doe", email: 'superman@gmail.com', password: "hello", password_confirmation: "hello")

    #testing all of our it statements
    it "is valid when password and password_confirmation are the same" do
      expect(test_user.password).to eq(test_user.password_confirmation)
    end

    it "NOT valid when password =/= password_confirmation" do
      test_user.password_confirmation = "Hello"
      expect(test_user.password).to_not eq(test_user.password_confirmation)
    end

    it "NOT valid without first name" do
      test_user.first_name = nil
      expect(test_user).to_not be_valid
    end

    it "NOT valid without last name" do
      test_user.last_name = nil
      expect(test_user).to_not be_valid
    end

    it "NOT valid without email" do
      test_user.email = nil
      expect(test_user).to_not be_valid
    end

    it "NOT valid without email" do
      test_user.email = nil
      expect(test_user).to_not be_valid
    end

    it "NOT valid if password is less than 3 characters" do
      test_user.password = "Hi"
      expect(test_user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    user = User.create(first_name: "John", last_name: "Doe", email: 'superman@gmail.com', password: "hello", password_confirmation: "hello")

    it "NOT valid if email and password do not match" do
      expect(User.authenticate_with_credentials(user[:email], "asfdghjk")).to be_nil
    end

    it "is valid if email is different case" do
      expect(User.authenticate_with_credentials("SUPERMAN@gmail.com", "hello")).to_not be_nil
    end

    it "is valid if email has leading or trailing spaces" do
      expect(User.authenticate_with_credentials("   SuPerMan@gmail.com  ", "hello")).to_not be_nil
    end
  end
end