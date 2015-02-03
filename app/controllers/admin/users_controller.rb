class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :index]
  before_action :admin_user, only: [:edit, :index, :new, :create, :destroy]

  def index
    @users = User.all
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
  end

  def destroy
    user=User.find params[:id]
    user.destroy
    flash[:success] = "User "+user.name+" has been deleted"
    redirect_to admin_users_path
  end

  private
  def admin_user
    redirect_to root_url unless current_user.supervisor?
  end

# Confirms a logged-in user.
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
