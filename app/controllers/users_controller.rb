class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/admin' 
    else 
      redirect_to '/signup' 
    end 
  end

  private def user_params
    params.require(:user).permit(:login, :password)
  end
end
