require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#password' do
    it 'should exist for new users' do
      @user = User.new(
        password: 'password'
      )
      expect(@user.password).to be_present
    end
  end

  describe '#password_confirmation' do
    it 'should exist for new users' do
      @user = User.new(
        password_confirmation: 'password'
      )
      expect(@user.password_confirmation).to be_present
    end
  end

  describe '#password_match' do
    it 'passwords should match' do
      @user = User.new(
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user.password).to eq(@user.password_confirmation)
    end
  end

  describe '#name' do
    it 'should exist for new users' do
      @user = User.new(
        name: 'Perry'
      )
      expect(@user.name).to be_present
    end
  end

  describe '#email' do
    it 'should exist for new users' do
      @user = User.new(
        email: 'test@test.com'
      )
      expect(@user.email).to be_present
    end
  end

  describe '#email_already_exists' do
    it 'shouldn\'t admit a new user into db if email address already exists' do
      @user1 = User.create(
        name: 'Perry',
        email: 'perry@perry.com',
        password_digest: 'password'
      )
      @user = User.new(
        email: 'perry@perry.com'
      )

      @existing_user = User.where("email ILIKE #{@user1.email}")

      expect(@user.email).to be_empty
    end
  end

end
