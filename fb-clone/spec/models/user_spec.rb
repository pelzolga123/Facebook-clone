require 'rails_helper'

RSpec.describe User, type: :model do


  context 'Validation tests' do
    let(:user) { build(:user) }

    it 'ensures email presence' do
      user.email = nil
      user.password = 'password123'
      user.password_confirmation = 'password123'
      expect(user.save).to eq(false)
    end

    it 'ensures password presence' do
      user.email = 'anniepelts@example.com'
      user.password = nil
      expect(user.save).to eq(false)
    end
  end

  context 'Association tests' do
    describe 'model associations' do
      it 'has many posts' do
        assc = User.reflect_on_association(:posts)
        expect(assc.macro).to eq :has_many
      end
    end
  end

end
