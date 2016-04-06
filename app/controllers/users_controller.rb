class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New user created: #{@user.username}"
      redirect_to action: "index"
    else
      flash[:notice] = @user.errors.full_messages
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render "show"
    else
      flash[:notice] = "That user doesn't exist"
      redirect_to action: "index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
