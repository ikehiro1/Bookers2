class UsersController < ApplicationController
  before_action :authenticate_user!
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
  
   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@books)
    else
      flash[:error] = "Book was error create"
      render 'index'
    end
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You hava update user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
   private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end
