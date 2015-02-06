class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :index]
  before_action :admin_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Created " + @user.name + " !"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  private
  def admin_user
    redirect_to root_url unless current_user.supervisor?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
