class BooksController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.new(:user => @user)
  end

  def create
    @user = User.find(params[:user_id])
    @book = Book.new(book_params)
    if @user.books << @book
      flash[:notice] = "New book saved"
      redirect_to user_book_path(@user, @book)
    else
      flash[:notice] = "Failed to save book"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Updated #{@book.title}"
      redirect_to user_book_path(@user, @book)
    else
      flash[:notice] = "Failed to update book"
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :pagecount, :description)
  end

end
