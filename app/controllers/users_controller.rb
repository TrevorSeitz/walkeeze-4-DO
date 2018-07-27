class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
    @dogs = Dog.where(user_id: @user.id)
  end

end
