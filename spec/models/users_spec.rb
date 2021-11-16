require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'is valid with valid attributes' do
      @user = User.new(email: 'test@test.test', password: 'testingpassword', password_confirmation: 'testingpassword', first_name: 'test', last_name: 'testname')
      expect(@user).to be_valid
    end

    it 'is invalid when passwords do not match' do
      @user = User.new(email: 'test@test.test', password: 'testingpassword', password_confirmation: 'notthesamepassword', first_name: 'test', last_name: 'testname')
      expect(@user).to_not be_valid
    end

    it 'requires unique, but not case sensitive, emails' do
      @user = User.new(email: 'test@test.test', password: 'testingpassword', password_confirmation: 'testingpassword', first_name: 'test', last_name: 'testname')
      @user.save
      @user2 = User.new(email: 'TEST@test.test', password: 'testingpassword1', password_confirmation: 'testingpassword1', first_name: 'test1', last_name: 'testname1')
      expect(@user2).to_not be_valid
    end

    it 'requires passwords to have a minimum length of 8 characters' do
      @user = User.new(email: 'test@test.test', password: 'test', password_confirmation: 'test', first_name: 'test', last_name: 'testname')
      expect(@user).to_not be_valid
    end
  end
end


# def user_params
#   params.require(:user).permit(:name, :email, :password, :password_confirmation)
# end
