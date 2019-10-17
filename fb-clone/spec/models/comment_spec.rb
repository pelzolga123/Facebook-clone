require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'model validation test' do
    let(:post) { build(:post) }
    let(:user) { build(:user) }
    let(:comment) { build(:comment) }

    it 'ensures a comment is invalid without a user and a post' do
      comment.user = nil
      comment.post = nil
      expect(comment.save).to eq(false)
    end

    it 'ensures a comment is invalid without a post and with a user' do
      comment.user = user
      comment.post = nil
      expect(comment.save).to eq(false)
    end

    it 'ensures a comment is invalid without a user and with a post' do
      comment.user = nil
      comment.post = post
      expect(comment.save).to eq(false)
    end
  end

  context 'model associations' do
    it 'belongs to user' do
      assc = Comment.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      assc = Comment.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
