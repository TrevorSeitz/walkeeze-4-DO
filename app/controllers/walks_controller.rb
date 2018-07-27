class WalksController < ApplicationController

  def index
    @walks = Walk.all
    @user = User.find(session[:user_id])
  end

  # def create
  #   @walk = Walk.find(params[:id].to_i)
  #   # if (params[:dog_ids].map(&:to_i) & @walk.dogs.ids).count > walk.available_spots
  #   # return error
  #   #byebug
  #   @walk.dogs = Dog.where(id: params[:dog_ids])
  #   @walk.save
  #
  #   redirect_to user_path(current_user)
  # end

  def create
    @user = User.find(session[:user_id])
    @walk = Walk.find(params[:id].to_i)
    if params[:dog_ids]
      params[:dog_ids].map(&:to_i).each do |d|
        if !@walk.dogs.ids.include?(d)
          @dog = Dog.find(d)
          @walk.dogs << @dog
        end
      end
    else
      params[:dog_ids]=[]
    end

    @walk.dogs.each do |wd|
      if !params[:dog_ids].map(&:to_i).include?(wd.id)
        if wd.user_id == current_user.id
          @walk.dogs.delete(wd)
        end
      end
    end

    if @walk.dogs.count > @walk.available_spots
      redirect_to edit_walk_url(@walk)
      flash[:notice] = 'There is not enough space for all these dogs! Please choose fewer dogs.'
    else
      @walk.save
      render 'confirm_walk'
    end
  end

  def update
    @dogs_walk_id = DogsWalk.where(dog_id: params[:dog_id].to_i, walk_id: params[:id].to_i)
    @dog_walk = DogsWalk.find(@dogs_walk_id.ids)[0]
    @dog_walk.notes = params[:note]
    @dog_walk.save
    @user = User.find(session[:user_id])
    redirect_to walk_path(params[:id])
  end

  def edit
    @walk = Walk.find(params[:id].to_i)
    @user = User.find(session[:user_id])
    @dogs = Dog.where(user_id: @user.id)
  end

  def show
    @walk = Walk.find(params[:id].to_i)
    @user = User.find(session[:user_id])
  end



  private

  def walk_params
    params.require(:walk).permit(:name, :length, :available, :available_spots, :date, :time, :notes)
  end

end
