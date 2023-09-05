class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user)  unless  @user == current_user
  end

  def show
    @user = current_user
    @books = @user.books
  end
  
  def update
  end
  
   #private
  #def user_params
   # params.require(:user).permit(:name, :introduction, :profile_image)
  #end

end
