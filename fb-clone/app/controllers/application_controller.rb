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
    @friendships_users = @friendships.map(&:friend)

    @pending = @friendships.reject(&:confirmed)
    @pending_users = @pending.map(&:friend)

    @accepted = @friendships.select(&:confirmed)
    @accepted_users = @accepted.map(&:friend)

    @expected = current_user.inverse_friendships.reject(&:confirmed)
    @expected_users = @expected.map(&:user)

    @accepted_inverse = current_user.inverse_friendships.select(&:confirmed)
    @accepted_inverse_users = @accepted_inverse.map(&:user)

    @accepted_users += @accepted_inverse_users
  end
end
