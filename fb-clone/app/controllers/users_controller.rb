class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :user_signed_in?, only: %i[create destroy]
  before_action :find_friends

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def request_friend
    @friendship = current_user.friendships.build(friend_id: params[:id])
    if @friendship.save
      flash.notice = 'Friend request sent'
    else
      flash.alert = 'Failed to send request'
    end
    redirect_to users_path
  end

  def accept_friend
    friend = Friendship.find_by(id: params[:id])
    @friendship = friend.update_attributes(confirmed: true)
    if @friendship
      flash.notice = 'Friend accepted'
    else
      flash.alert = 'Failed to accept request'
    end
    redirect_to users_path
  end

  private

  def set_user; end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
