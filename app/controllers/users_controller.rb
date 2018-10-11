class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @dogs = Dog.where(user_id: @user.id)
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update_attribute(:avatar, params[:user][:avatar])
  # end

end
