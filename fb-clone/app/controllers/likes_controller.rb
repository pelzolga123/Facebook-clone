class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def new
    @like = Like.new(like_params)
  end

  def create
    if already_liked?
      respond_to do |format|
        format.html { redirect_to request.referer, alert: 'Liked' }
      end
    else
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(like_params)
      @like.user = current_user
      respond_to do |format|
      if @like.save!
        format.html { redirect_to request.referer }
        format.json { render :show, status: :created, location: @post, alert: 'Post liked!' }
      else
        format.html { redirect_to authenticated_root_path, alert: 'No like!' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.permit(:user_id, :post_id)
  end

  def set_like
    @like = @post.likes.build(like_params)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end
