class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :instantiate_post
  before_action :instantiate_comment

  def instantiate_post
    @post = Post.new
  end

  def instantiate_comment
    @comment = Comment.new
  end

  def find_friends
    @friendships = current_user.friendships 
    @friendships_users = @friendships.map { |friend| friend.friend }
    @pending = @friendships.select { |friendship| !friendship.confirmed }
    @pending_users = @pending.map { |pending| pending.friend }
    @accepted = @friendships.select { |friendship| friendship.confirmed }
    @accepted_users = @accepted.map { |friend| friend.friend }
    @expected = current_user.inverse_friendships.select{ |friendship| !friendship.confirmed }
    @expected_users = @expected.map { |expected| expected.friend }
  end
end
