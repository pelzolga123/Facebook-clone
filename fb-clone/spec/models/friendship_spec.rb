require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Validation tests' do
    let(:user) { build(:user) }
    let(:friendship) { build(:friendship) }

    it 'ensures friendship is invalid without user and friend' do
      friendship.user = nil
      friendship.friend = nil
      expect(friendship.save).to eq(false)
    end

    it 'ensures friendship is invalid with user and without friend' do
      friendship.user = user
      friendship.friend = nil
      expect(friendship.save).to eq(false)
    end

    it 'ensures friendship is invalid without user but with friend' do
      friendship.user = nil
      friendship.friend = user
      expect(friendship.save).to eq(false)
    end
  end
end
