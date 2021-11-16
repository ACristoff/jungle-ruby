require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'is valid with valid attributes' do
      @user = User.new(email: 'test@test.test', password_digest: 'fhjdgsfjkhg', first_name: 'test', last_name: 'testname')
      expect(@user).to be_valid
    end

    
  end
end
