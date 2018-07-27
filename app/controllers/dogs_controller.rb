class DogsController < ApplicationController

  def new
    @dog = Dog.new
    @user = User.find(session[:user_id])
  end

  def index
    @dogs = Dog.all
  end

  def create
    @user = User.find(session[:user_id])
    @dog = Dog.create(dog_params)
    # byebug
    @dog.user_id = @user.id
    @dog.save
    if @dog.valid?
      redirect_to user_path(@user)
    else
      redirect_to new_dog_path
    end
  end

  def update
    @dog = Dog.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :user_id, :notes)
  end

end
