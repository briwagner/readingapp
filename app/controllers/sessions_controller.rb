class SessionsController < ApplicationController

  def index
    @session = Session.new
    render 'index'
  end

end