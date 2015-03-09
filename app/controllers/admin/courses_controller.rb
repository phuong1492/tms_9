class Admin::CoursesController < ApplicationController
before_action :logged_in_user, only: [:show, :edit, :update, :index]
before_action :admin_user
	def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
  end

  def new
  	@course = Course.new
  	@users = User.without_user current_user
  end

  def create
  	@course = Course.new course_params
  	if @course.save
  	  flash[:success] = "Add new success!"
  	  redirect_to admin_courses_path
  	  return
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

  def course_params
    params.require(:course).permit(:name, 
    user_courses_attributes: [:user_id, :_destroy, :id])
  end
end
