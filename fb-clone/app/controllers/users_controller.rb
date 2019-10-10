class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :user_signed_in?, only: %i[create destroy]

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

    private

  def set_user; end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
