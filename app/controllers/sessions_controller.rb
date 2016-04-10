class SessionsController < ApplicationController

  def index
    @session = Session.new
    @users = User.all
    render 'index'
  end

  def destroy
    reset_session
    flash[:notice] = "You're logged out"
    redirect_to root_path
  end

  def create
    if @user = User.find(params[:id])
      Session.create(user_id: @user.id)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "That user doesn't exist"
      render 'index'
    end
  end

end