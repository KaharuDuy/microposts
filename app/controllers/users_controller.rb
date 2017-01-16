class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def following
    @user = User.find(params[:id])
    @followeds = @user.following_users.order(created_at: :desc)
    render 'show_following'
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users.order(created_at: :desc)
    render 'show_followers'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if @user != current_user
  end
  
  
end