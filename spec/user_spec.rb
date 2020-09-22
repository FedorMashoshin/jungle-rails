require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'returns true if all fields are filled' do 
      @user = User.create(
        first_name: "Alexa", 
        last_name: "Test", 
        email:"alexa@test.com",
        password:"12345",
        password_confirmation:"12345")
    expect(@user.save).to be true
    end

    it "return false if password confirmation different from original" do
      @user = User.create(
        first_name: "Alexa", 
        last_name: "test", 
        email:"alexa1@test.com",
        password:"12345",
        password_confirmation:"54321")
      expect(@user.save).to be false
    end

    it "should return false if email exists not case sensitive" do
    @user1 = User.create(
        first_name: "Barabara", 
        last_name: "test", 
        email:"alexa@test.com",
        password:"12345",
        password_confirmation:"12345")
      @user2 = User.create(
        first_name: "Alexaa", 
        last_name: "test", 
        email:"ALEXA@TEST.com",
        password:"12345",
        password_confirmation:"12345")
      expect(@user2.save).to be false
    end

    it "should return false if there is no first name" do
      @user = User.create(
        first_name: nil, 
        last_name: "test", 
        email:"alexa1@test.com",
        password:"12345",
        password_confirmation:"12345")
        expect(@user.save).to be false
    end

    it "should return false if there is no last name" do
      @user = User.create(
        first_name: "tester", 
        last_name: nil, 
        email:"alexa1@test.com",
        password:"12345",
        password_confirmation:"12345")
        expect(@user.save).to be false
    end

    it "should return false if there is no email" do
      @user = User.create(
        first_name: "alexa", 
        last_name: "test", 
        email: nil,
        password:"12345",
        password_confirmation:"12345")
        expect(@user.save).to be false
    end
  end
end