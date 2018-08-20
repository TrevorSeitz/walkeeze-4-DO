class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def index
    @dogs = Dog.all
  end

  def create
    @dog = current_user.dogs.build(dog_params)
    @dog.save
    if @dog.valid?
      redirect_to user_path(@user)
    else
      redirect_to new_dog_path
    end
  end

  def update
    @dog = Dog.find(params[:id])
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def schedule
    @dog = Dog.find(params[:id])
    @walks = @dog.walks
    render json: @walks, status: 201
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :user_id, :notes)
  end

end
