class WelcomeController < ApplicationController
  def home
    if current_user
      @user = User.find(current_user.id)
    end
  end
end
