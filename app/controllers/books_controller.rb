class BooksController < ApplicationController
  before_action :currect_user, only: [:edit, :update]
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def show
    @book = Book.new
    @showbook = Book.find(params[:id])
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
       flash[:error] = "Book was error create"
       @books = Book.all
       @user = current_user
      render 'index'
    end
  end
  
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] = "Book was successfully updated"
        redirect_to book_path(@book.id)
    else 
        flash[:error] = "Book was error update"
        render:'edit'
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end 
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
