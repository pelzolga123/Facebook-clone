require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:post) { build(:post) }
  let(:user) { build(:user) }
  let(:like) { build(:like) }

  context 'model validation test' do
    it 'ensures a like is invalid without a user and a post' do
      like.user = nil
      like.post = nil
      expect(like.save).to eq(false)
    end

    it 'ensures a like is invalid without a user and with post' do
      like.user = nil
      like.post = post
      expect(like.save).to eq(false)
    end

    it 'ensures a like is invalid without a post and with user' do
      like.user = user
      like.post = nil
      expect(like.save).to eq(false)
    end

    it 'ensures a like is valid with a post and with user' do
      like.user = user
      like.post = post
      expect(like.save).to eq(false)
    end

    it 'ensures a like is invalid without a unique user and post' do
      like.user = user
      like.post = post
      like.save
      like = Like.new(user_id: user.id, post_id: post.id)
      expect(like.save).to eq(false)
    end

  end

  context 'model associations' do
    it 'belongs to user' do
      assc = Like.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      assc = Like.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
