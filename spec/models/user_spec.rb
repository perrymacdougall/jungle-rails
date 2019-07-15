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

  describe '#password_length' do
    it 'should have at least eight characters' do
      @user = User.new(
        password: 'password'
      )
      expect(@user.password.length).to be >= 8
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
      @existing_user = User.create(
        name: 'Perry',
        email: 'perry@perry.com',
        password_digest: 'password'
      )
      @user = User.new(
        email: 'perry1@perry.com'
      )

      expect(@user.email).to_not eq(@existing_user.email)
    end
  end

end
