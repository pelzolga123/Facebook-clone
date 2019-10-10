require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Validation tests' do
    let(:post) { build(:post) }
    let(:user) { build(:user) }

    it 'ensures content is not empty' do
      post.content = nil
      expect(post.save).to eq(false)
    end

    it 'ensures content is not less than 5 characters' do
      post.content = 'a' * 4
      expect(post.save).to eq(false)
    end

    it 'ensures content is not more than  500 characters' do
      post.content = 'a' * 501
      expect(post.save).to eq(false)
    end

    it 'ensures content has a user' do
      post.user = nil
      expect(post.save).to eq(false)
    end
  end

  context 'Association tests' do
    describe 'model associations' do
      it 'belongs to' do
        assc = Post.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
