require 'rails_helper'

RSpec.describe Comment, type: :model do

  context 'model validation test' do
    let(:post) { build(:post) }
    let(:user) { build(:user) }
    let(:comment) { build(:comment) }



    it 'ensures a post is invalid without a user' do
      comment.post = post
      expect(comment).to eq(false)
    end

    it 'ensures a comment is invalid without a user and a post' do
      expect(comment).to eq(false)
    end


    it 'ensures a comment is invalid without a post and with a user' do
      comment.user = user
      comment.post = nil
      expect(comment).to eq(false)
    end


    it 'ensures a comment is invalid without a post and with a user' do
      comment.user = user
      comment.post = post
      expect(comment).to be_valid
    end
  end

  context 'Comment model associations' do
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
