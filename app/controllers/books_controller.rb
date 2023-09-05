class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:id])
    @book.image_id = current_user
    @book.save
    redirect_to book_images_path
  end
  
  def update
  end 
  
  def destroy
  end 
end
