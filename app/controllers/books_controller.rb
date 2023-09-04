class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @books = Book.find(params[:id])
  end
  
  def create
  end
  
  def update
  end 
  
  def destroy
  end 
end
