class ReadingsController < ApplicationController


  def show
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @reading = Reading.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @reading = Reading.new
  end

  def create
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @reading = @book.readings.new(reading_params)
    if @reading.save
      flash[:notice] = "Saved. Now start reading!"
      redirect_to user_book_reading_path(@user, @book, @reading)
    else
      flash[:notice] = "Failed to start reading"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @reading = Reading.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @reading = Reading.find(params[:id])
    if @reading.update_attributes(update_reading_params)
      flash[:notice] = "Saved. Nice job reading."
      redirect_to user_book_reading_path(@user, @book, @reading)
    else
      render 'edit'
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:startpage, :starttime)
  end

  def update_reading_params
    params.require(:reading).permit(:startpage, :starttime, :endpage, :endtime)
  end
end
