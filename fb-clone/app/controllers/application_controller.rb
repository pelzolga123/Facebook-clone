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
end
