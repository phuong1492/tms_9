class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :index]
  before_action :admin_user

  def index
    @users = User.all
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
