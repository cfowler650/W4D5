require 'rails_helper'

  RSpec.describe User, type: :model do
      describe User do 
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:session_token) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_length_of(:password).is_at_least(6) }
   end


  describe '::find_by_credentials' do
    let!(:Harrypotter) {
      User.create!(
        username: 'Harrypotter',
        password: '1234567'
      )
    }

    it 'finds the user' do
      user = User.find_by(username: 'Harrypotter')
      expect(user).to eq(true)
    end

    it 'checks user password' do 
      expect(user).is_password?(password).to eq(true)
    end 

    it 'returns the user' do 
      expect(User.find_by_credentials(username, password)).to be(:Harrypotter)
    end 

  end




  end

