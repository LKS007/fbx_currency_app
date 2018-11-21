class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(login: params[:session][:login])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/admin', notice: "Yeah! You input correct login/password"
    else

      redirect_to '/login', alert: "Invalid password or login"
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
